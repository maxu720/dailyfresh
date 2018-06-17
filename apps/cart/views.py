#coding=utf-8
from django.shortcuts import render
from django.views.generic import View
from django.http import JsonResponse
from ..goods.models import GoodsSKU
from django_redis import get_redis_connection
import json



# Create your views here.


class DeleteCartView(View):
    """删除购物车"""

    def post(self, request):

        # 接收参数：sku_id
        sku_id = request.POST.get('sku_id')

        # 校验参数：not，判断是否为空
        if not sku_id:
            return JsonResponse({'code':1, 'message':'sku_id为空'})

        # 判断sku_id是否合法
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'code':2, 'message':'商品不存在'})

        # 判断用户是否登录
        if request.user.is_authenticated():
            # 如果用户登陆，删除redis中购物车数据
            redis_conn = get_redis_connection('default')
            user_id = request.user.id

            # 当redis中药删除的数据为空,那么redis_conn会自动的忽略
            redis_conn.hdel('cart_%s' % user_id, sku_id)

        else:
            # 如果用户未登陆，删除cookie中购物车数据
            cart_json = request.COOKIES.get('cart')
            if cart_json is not None:
                cart_dict = json.loads(cart_json)

                del cart_dict[sku_id]

                new_cart_json = json.dumps(cart_dict)

                response = JsonResponse({'code': 0, 'message':'删除购物车数据成功'})

                response.set_cookie('cart', new_cart_json)

                return response

        return JsonResponse({'code': 0, 'message': '删除购物车数据成功'})


class UpdateCartView(View):
    """更新购物车"""

    def post(self, request):
        """+ - 手动输入"""

        # 获取参数：sku_id, count
        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')

        # 校验参数all()
        if not all([sku_id, count]):
            return JsonResponse({'code':1, 'message':'参数不全'})

        # 判断商品是否存在
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'code':2, 'message':'商品不存在'})

        # 判断count是否是整数
        try:
            count = int(count)
        except Exception:
            return JsonResponse({'code':3, 'message':'商品数量错误'})

        # 判断库存
        if count > sku.stock:
            return JsonResponse({'code': 4, 'message': '库存不足'})

        # 判断用户是否登陆
        if request.user.is_authenticated():
            # 如果用户登陆，将修改的购物车数据存储到redis中
            redis_conn = get_redis_connection('default')
            user_id = request.user.id

            # 直接拿着用户发送过来的商品的数量赋值即可 : 因为更新购物车的接口设计成幂等.count就是最终要更新的数据
            # 不需要判断商品是否存在.不需要累加计算
            redis_conn.hset('cart_%s' % user_id, sku_id, count)

            return JsonResponse({'code': 0, 'message': '更新购物车成功'})
        else:
            # 如果用户未登陆，将修改的购物车数据存储到cookie中
            cart_json = request.COOKIES.get('cart')
            if cart_json is not None:
                cart_dict = json.loads(cart_json)
            else:
                cart_dict = {}

            # 直接拿着用户发送过来的商品的数量赋值即可 : 因为更新购物车的接口设计成幂等.count就是最终要更新的数据
            # 不需要判断商品是否存在.不需要累加计算
            cart_dict[sku_id] = count

            # 把cart_dict转成json字符串
            new_cart_json = json.dumps(cart_dict)

            # 创建response对象
            response = JsonResponse({'code': 0, 'message': '更新购物车成功'})

            # 写入购物车cookie到浏览器
            response.set_cookie('cart', new_cart_json)

            return response


class CartInfoView(View):
    """展示购物车数据"""

    def get(self, request):
        """查询登录和未登录的购物车数据,并渲染"""

        # 判断用户是否是登录用户
        if request.user.is_authenticated():
            # 用户已登录,购物车数据redis中查询
            redis_conn = get_redis_connection('default')
            user_id = request.user.id
            # django_redis读取hash类型的数据得到的字典.里面的key和value是bytes类型的
            cart_dict = redis_conn.hgetall('cart_%s' % user_id)

        else:
            # 用户未登录,购物车数据cookie中查询
            cart_json = request.COOKIES.get('cart')
            # json模块读取的cookie中的购物车数据,key是string,而value是int
            if cart_json is not None:
                cart_dict = json.loads(cart_json)
            else:
                cart_dict = {}

        # 定义临时变量
        skus = []
        total_count = 0
        total_sku_amount = 0

        # 遍历所有的购物车商品信息,查询商品和count
        for sku_id, count in cart_dict.items():

            try:
                sku = GoodsSKU.objects.get(id=sku_id)
            except GoodsSKU.DoesNotExist:
                continue

            # 无论是从哪里得到的count,都转成int
            count = int(count)
            # 小计
            amount = sku.price * count

            # 动态给sku对象绑定 count 和 amount
            sku.count = count
            sku.amount = amount
            skus.append(sku)

            # 累计金额和数量
            total_count += count
            total_sku_amount += amount

        # 构造上下文
        context = {
            'skus':skus,
            'total_count':total_count,
            'total_sku_amount':total_sku_amount
        }

        # 渲染模板
        return render(request, 'cart.html', context)


class AddCartView(View):
    """添加购物车"""

    def post(self, request):
        """接受ajax的post过来的购物车数据,存储到redis"""

        # 判断用户是否登录
        # if not request.user.is_authenticated():
        #     return JsonResponse({'code':1, 'message':'用户未登录'})

        # 收集购物车参数: ku_id, count
        sku_id = request.POST.get('sku_id')
        count = request.POST.get('count')

        # 校验购物车参数 all()
        if not all([sku_id, count]):
            return JsonResponse({'code': 2, 'message': '缺少参数'})

        # 判断sku_id是否合法
        try:
            sku = GoodsSKU.objects.get(id=sku_id)
        except GoodsSKU.DoesNotExist:
            return JsonResponse({'code': 3, 'message': 'sku_id错误'})

        # 判断count是否合法
        try:
            count = int(count)
        except Exception:
            return JsonResponse({'code': 4, 'message': '商品count错误'})

        # 判断是否超出库存 sku.stock
        if count > sku.stock:
            return JsonResponse({'code': 5, 'message': '库存不足'})

        # 判断用户是否登录
        if request.user.is_authenticated():

            # 获取user_id
            user_id = request.user.id

            # 加入购物车 django_redis
            redis_conn = get_redis_connection('default')
            # 判断要添加的数据是否存在,如果存在累加,反之,赋值新值
            origin_count = redis_conn.hget('cart_%s' % user_id, sku_id)
            if origin_count is not None:
                # origin_count : bytes
                count += int(origin_count)

            # 再次验证:判断是否超出库存 sku.stock (防止累加数量后超过库存)
            if count > sku.stock:
                return JsonResponse({'code': 5, 'message': '库存不足'})

            redis_conn.hset('cart_%s' % user_id, sku_id, count)

            # 为了配合前端页面,展示最终的购物车数据的总数,需要在响应json之前,查询购物车数据
            cart_num = 0
            cart_dict = redis_conn.hgetall('cart_%s' % user_id)
            for val in cart_dict.values():
                cart_num += int(val)  # val 是bytes类型的

            # 响应结果 json
            return JsonResponse({'code': 0, 'message': '加入购物车成功', 'cart_num': cart_num})
        else:
            # 用户未登录.使用cookie存储购物车数据 cart_json = '{'sku_id1':1, 'sku_id2':2}'
            cart_json = request.COOKIES.get('cart')

            if cart_json is not None:
                cart_dict = json.loads(cart_json)
            else:
                cart_dict = {} # 因为后面要使用cart_dict新增购物车数据,所以这里需要额外定义一个空的字典

            # 判断要添加的商品是否在cookie中,如果在.累加,反之.赋新值
            if sku_id in cart_dict:
                origin_count = cart_dict[sku_id] # origin_count是int类型的
                count += origin_count

            # 再再次验证:判断是否超出库存 sku.stock (防止累加数量后超过库存)
            if count > sku.stock:
                return JsonResponse({'code': 5, 'message': '库存不足'})

            # 操作字典,存储sku_id和count (说明:sku_id是字符串,而count是int类型)
            cart_dict[sku_id] = count

            # 为了配合前端页面,展示最终的购物车数据的总数,需要在响应json之前,查询购物车数据
            cart_num = 0
            for val in cart_dict.values():
                cart_num += val

            # 需要将最新的cart_dict,转成json字符串
            new_cart_json = json.dumps(cart_dict)

            # 创建JsonResponse对象
            response = JsonResponse({'code': 0, 'message': '加入购物车成功', 'cart_num':cart_num})

            response.set_cookie('cart', new_cart_json)

            return response



