"""cowrywise URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path, include
from rest_framework.routers import SimpleRouter,DefaultRouter
from esusu.views import UserViewSet
from esusu import views
from rest_framework_simplejwt import views as jwt_views

from esusu.views import GroupViewSet


urlpatterns = [
    # Your URLs...
    path('me', views.welcome, name='welcome'),
    path('mean', views.welcome, name='welcome'),
    path('hello', views.welcome, name='welcome'),
    path('new', views.welcome, name='welcome'),
    path('api/v1/token', jwt_views.TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/v1/token/refresh', jwt_views.TokenRefreshView.as_view(), name='token_refresh'),
]
router = DefaultRouter(trailing_slash=False)
router.register(r'users', UserViewSet)
# router.register(r'profiles', UserProfileViewSet)
urlpatterns += [
    path('admin/', admin.site.urls),
]
urlpatterns += [
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),
]
urlpatterns += [
        re_path('api/v1/', include('esusu.urls')),
    ]
urlpatterns += [
    re_path('api/v1/', include(router.urls)),
]