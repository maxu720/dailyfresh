#coding=utf-8

from django.shortcuts import render, redirect
from django.views.generic import View
from goods.models import GoodsCategory, Goods, GoodsSKU, IndexGoodsBanner, IndexCategoryGoodsBanner, IndexPromotionBanner
from django.core.cache import cache
from django_redis import get_redis_connection
from django.core.urlresolvers import reverse
from django.core.paginator import Paginator, EmptyPage


# Create your views here.



class ListView(View):
    """商品分类列表页"""

    def get(self, request, category_id, page_num):
        """根据用户要看的商品分类,和要看的页数,及排序规则,查询出用户要的数据,并渲染"""

        # 读取排序规则 当用户不传入sort时,我们需要指定为默认排序规则
        sort = request.GET.get('sort', 'default')

        # 查询用户要看的商品分类category对象
        try:
            category = GoodsCategory.objects.get(id=category_id)
        except GoodsCategory.DoesNotExist:
            return redirect(reverse('goods:index'))

        # 查询全部商品分类
        categorys = GoodsCategory.objects.all()

        # 查询新品推荐
        new_skus = GoodsSKU.objects.filter(category=category).order_by('-create_time')[:2]

        # 查询所有category关联的sku,并完成排序 sort = 12345678okjhgfdr678okjbvdrtikcdyk
        if sort == 'price':
            skus = GoodsSKU.objects.filter(category=category).order_by('price')
        elif sort == 'hot':
            skus = GoodsSKU.objects.filter(category=category).order_by('-sales')
        else:
            skus = GoodsSKU.objects.filter(category=category)
            # 重置sort,后面要使用,不能出现sort = 12345678okjhgfdr678okjbvdrtikcdyk
            sort = 'default'

        # 实现分页: 对skus分页.每页2个GoodsSKU模型对象
        paginator = Paginator(skus, 2)

        # 获取用户要看的那一页数据
        page_num = int(page_num)
        # 每页2个GoodsSKU模型对象 >>> page_skus = [GoodsSKU, GoodsSKU]
        try:
            page_skus = paginator.page(page_num)
        except EmptyPage:
            page_skus = paginator.page(1)

        # 先获取页码列表信息,再传给模板,不用在模板中去获取
        page_list = paginator.page_range

        # 构造上下文
        context = {
            'category':category,
            'categorys':categorys,
            'new_skus':new_skus,
            'page_skus':page_skus, # 只需要传入分页后的商品sku信息
            'page_list':page_list,
            'sort':sort
        }

        # 渲染模板
        return render(request, 'list.html', context)


class DetailView(View):
    """详情"""

    def get(self, request, sku_id):
        """查询详情信息,渲染模板"""

        # 查询商品SKU信息
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return redirect(reverse('goods:index'))

        # 查询商品分类信息
        categorys = GoodsCategory.objects.all()

        # 从订单中获取评论信息
        sku_orders = sku.ordergoods_set.all().order_by('-create_time')[:30]
        if sku_orders:
            for sku_order in sku_orders:
                sku_order.ctime = sku_order.create_time.strftime('%Y-%m-%d %H:%M:%S')
                sku_order.username = sku_order.order.user.username
        else:
            sku_orders = []

        # 查询新品推荐信息:查询最新发布的两件商品
        new_skus = GoodsSKU.objects.filter(category=sku.category).order_by('-create_time')[:2]

        # 查询其他规格商品:当前商品是500g规格的, exclude()
        other_skus = sku.goods.goodssku_set.exclude(id=sku_id)

        """
        500g规格草莓  盒装草莓

        sku = 500g规格草莓
        sku.goods = 草莓
        sku.goods.goodssku_set() == 500g规格草莓  盒装草莓
        sku.goods.goodssku_set().exclude(id=500g规格草莓_id)
        """

        # 查询购物车信息:目前没有实现,暂时设置成0,不能被缓存
        cart_num = 0

        # 如果是登录用户,需要查询保存在redis中的购物车数据
        if request.user.is_authenticated():

            # 创建连接到redis的对象
            redis_conn = get_redis_connection('default')

            # 调用hgetall(),查询hash对象中所有的数据,返回字典(说明,字典的key和value是字节类型(bytes))
            user_id = request.user.id
            cart_dict = redis_conn.hgetall('cart_%s' % user_id)

            # 遍历字典,读取商品数量,求和
            for val in cart_dict.values():
                cart_num += int(val)  # 说明,字典的key和value是字节类型

            # 需要先去重
            redis_conn.lrem('history_%s' % user_id, 0, sku_id)
            # 记录用户浏览信息
            redis_conn.lpush('history_%s' % user_id, sku_id)
            # 最多存储5个
            redis_conn.ltrim('history_%s' % user_id, 0, 4)

        # 构造上下文
        context = {
            'sku':sku,
            'categorys':categorys,
            'sku_orders':sku_orders,
            'new_skus':new_skus,
            'other_skus':other_skus,
            'cart_num':cart_num
        }

        # 渲染模板
        return render(request, 'detail.html', context)


class IndexView(View):
    """主页"""

    def get(self, request):
        """查询主页商品数据,并渲染"""

        # 查询是否有缓存:存储的数据类型和读取的数据类型相同
        context = cache.get('index_page_data')
        if context is None:
            print('没有缓存,查询数据')

            # 查询登录user信息:在request中
            # 查询商品分类信息
            categorys = GoodsCategory.objects.all()

            # 查询图片轮播信息: 默认从小到大排序
            goods_banners = IndexGoodsBanner.objects.all().order_by('index')

            # 查询商品活动信息: 默认从小到大排序
            promotion_banners = IndexPromotionBanner.objects.all().order_by('index')

            # 查询商品分类列表展示信息
            for category in categorys:
                image_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=1)
                category.image_banners = image_banners

                title_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=0)
                category.title_banners = title_banners

            # 构造上下文
            context = {
                'categorys':categorys,
                'goods_banners':goods_banners,
                'promotion_banners':promotion_banners,
            }

            # 缓存context : 缓存的key  要缓存的内容   超时时间,秒为单位
            cache.set('index_page_data', context, 3600)

        # 查询购物车信息:目前没有实现,暂时设置成0,不能被缓存
        cart_num = 0

        # 如果是登录用户,需要查询保存在redis中的购物车数据
        if request.user.is_authenticated():

            # 创建连接到redis的对象
            redis_conn = get_redis_connection('default')

            # 调用hgetall(),查询hash对象中所有的数据,返回字典(说明,字典的key和value是字节类型(bytes))
            user_id = request.user.id
            cart_dict = redis_conn.hgetall('cart_%s' % user_id)

            # 遍历字典,读取商品数量,求和
            for val in cart_dict.values():
                cart_num += int(val) # 说明,字典的key和value是字节类型

        # 跟新context
        context.update(cart_num=cart_num)

        # 渲染模板
        return render(request, 'index.html', context)
