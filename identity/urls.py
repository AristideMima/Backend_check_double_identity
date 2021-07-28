from rest_framework import routers
from django.urls import include, path, re_path
from .api import *

router = routers.DefaultRouter()
router.register('api/clients', ClientView, 'identity')

urlpatterns = [
    path('', include(router.urls)),
    path('api/clients/check_identity', ClientView.as_view({'get': 'check_account'})),
    re_path(r'^api/upload/', FileUpload.as_view())
]