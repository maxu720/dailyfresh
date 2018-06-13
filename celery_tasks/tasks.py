#coding=utf-8

import os
import codecs


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "dailyfresh_23.settings")

#https://blog.csdn.net/michael_lbs/article/details/74923367

from django.core.mail import send_mail
from django.conf import settings
from apps.goods.models import GoodsCategory, Goods, GoodsSKU, IndexGoodsBanner, IndexCategoryGoodsBanner, IndexPromotionBanner
from django.template import loader
import os
from functools import wraps

print("============",settings.STATICFILES_DIRS[0])


# 创建Celery客户端
# 参数1 异步任务位置 参数2 指定人物存放的队列(Redis)
# app = Celery('celery_tasks.tasks', broker='redis://192.168.0.107:6379/4')
from celery import task

from celery import platforms

platforms.C_FORCE_ROOT=True


# @app.task
@task.task()
def send_active_email(to_email, user_name, token):
    subject = "天天生鲜用户激活"  # 标题
    body = ""  # 文本邮件体
    sender = settings.EMAIL_FROM  # 发件人
    receiver = [to_email]  # 接收人
    html_body = '<h1>尊敬的用户 %s, 感谢您注册天天生鲜！</h1>' \
                '<br/><p>请点击此链接激活您的帐号<a href="http://127.0.0.1:8000/users/active/%s">' \
                'http://127.0.0.1:8000/users/active/%s</a></p>' % (user_name, token, token)
    send_mail(subject, body, sender, receiver, html_message=html_body)


# @app.task
@task.task()
def generate_static_index_html():

    print('generate_static_index_html')
    """生成静态主页"""

    # 查询商品分类信息
    categorys = GoodsCategory.objects.all()

    # 查询图片轮播信息
    index_banners = IndexGoodsBanner.objects.all().order_by('index')

    # 查询商品活动信息
    promotion_banners = IndexPromotionBanner.objects.all().order_by('index')

    # 查询商品分类列表信息
    for category in categorys:
        # 查询标题类型展示的商品
        title_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=0)
        category.title_banners = title_banners

        # 查询图片类型展示的商品
        image_banners = IndexCategoryGoodsBanner.objects.filter(category=category, display_type=1)
        category.image_banners = image_banners

    # 查询购物车信息
    cart_num = 0

    # 构造上下文
    context = {
        'categorys': categorys,
        'index_banners': index_banners,
        'promotion_banners': promotion_banners,
        'cart_num': cart_num
    }

    # 加载模板

    template = loader.get_template('static_index.html')
    # 上下文渲染模板
    html_data = template.render(context)

    # 获取静态文件路径
    file_path = os.path.join(settings.STATICFILES_DIRS[0], 'index.html')
    # 将生成的html数据，存储到静态文件夹
    with codecs.open(file_path, 'w',encoding='utf-8') as file:
        file.write(html_data)


