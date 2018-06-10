import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

print(BASE_DIR)

# 为了配合django用户认证系统模型类的使用,需要增加导包路径
import sys
sys.path.insert(1, os.path.join(BASE_DIR, 'apps'))

from django.contrib import admin
from goods.models import GoodsCategory, Goods, IndexPromotionBanner
from celery_tasks.tasks import generate_static_index_html
from django.core.cache import cache

# Register your models here.


class BaseAdmin(admin.ModelAdmin):

    def delete_model(self, request, obj):
        obj.delete()
        # 触发异步任务
        generate_static_index_html.delay()
        cache.delete('index_page_data')


    # 点击保存时,触发异步任务:生成静态主页到nginx
    def save_model(self, request, obj, form, change):
        # 保证IndexPromotionBanner可以实现数据的存储,而不会被覆盖
        obj.save()
        # 触发异步任务
        print('gen index.html')
        generate_static_index_html.delay()
        cache.delete('index_page_data')


class IndexPromotionBannerAdmin(BaseAdmin):
    """IndexPromotionBanner模型类的管理类"""

    # list_per_page = 10

    pass


class GoodsAdmin(BaseAdmin):
    """IndexPromotionBanner模型类的管理类"""

    # list_display = [id]

    pass


class GoodsCategoryAdmin(BaseAdmin):
    """IndexPromotionBanner模型类的管理类"""

    pass


admin.site.register(GoodsCategory, GoodsCategoryAdmin)
admin.site.register(Goods, GoodsAdmin)
admin.site.register(IndexPromotionBanner, IndexPromotionBannerAdmin)
