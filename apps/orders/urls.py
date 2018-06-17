#coding=utf-8

from django.conf.urls import url
from ..orders import views


urlpatterns = [
    url(r'^place$', views.PlaceOrderView.as_view(), name='place'),
    # 订单提交
    url(r'^commit$', views.CommitOrderView.as_view(), name='commit'),
    # 订单信息页面
    url(r'^(?P<page>\d+)$', views.UserOrdersView.as_view(), name='info'),
    # 支付 : htpp://127.0.0.1:8000/orders/pay (需要传入的数据都在post请求的请求体中)
    url(r'^pay$', views.PayView.as_view(), name='pay'),
]