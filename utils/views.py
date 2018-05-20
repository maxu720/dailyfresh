from functools import wraps
from django.db import transaction
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse


class LoginRequiredMixin(object):
    """验证用户是否登陆"""
    @classmethod
    def as_view(cls, **initkwargs):
        view = super().as_view(**initkwargs)
        return login_required(view)


def login_required_json(view_func):

    @wraps(view_func)
    def wrapper(request):
        if not request.user.is_authenticated():
            return JsonResponse({'code': 1, 'message': '用户未登陆'})
        else:
            return view_func()
    return wrapper


class LoginRequiredJSONJMixin(object):
    """重写as_view()"""

    @classmethod
    def as_view(cls, **initkwargs):
        """使用login_required装饰器,装饰View的as_view()执行之后的结果"""
        view = super().as_view(**initkwargs)

        # 没有把装饰之后的结果返回,只把最原始的结果返回
        # return view

        # 把view装饰装饰之后的结果,返回
        return login_required(view)


class TransactionAtomicMixin(object):
    """事务装饰器"""

    @classmethod
    def as_view(cls, **initkwargs):
        """使用login_required装饰器,装饰View的as_view()执行之后的结果"""
        view = super().as_view(**initkwargs)

        # 把view装饰装饰之后的结果,返回
        return transaction.atomic(view)

