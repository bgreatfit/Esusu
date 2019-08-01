from django.urls import path, re_path
from . import views

app_name = 'esusu'
urlpatterns = [ path('groups', views.ListCreateGroup.as_view(), name='group-list'),
    re_path('users/(?P<user_pk>\d+)/groups/$', views.ListCreateGroup.as_view(), name='group-list'),
    re_path('users/(?P<user_pk>\d+)/groups/(?P<pk>\d+)/$',
            views.RetrieveUpdateDestroyGroup.as_view(), name='group-detail'),
    # path('groups', views.CourseListView.as_view(), name='course-list'),
    # re_path('groups/(?P<pk>\d+)/$', views.RetrieveUpdateDestroyCourse.as_view(), name='course-detail'),
    # path('groups/<uuid:pk>/join/', views.renew_book_librarian, name='renew-book-librarian'),
    # path('list', views.CourseListView.as_view(), name='course-list'),

]