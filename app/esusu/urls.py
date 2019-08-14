from django.urls import path, re_path
from . import views

urlpatterns = [
    path('public/groups', views.ListCreateGroup.as_view(), name='group-list'),
    path('groups', views.ListCreateGroup.as_view(), name='group-list'),
    # path('users/<int:pk>/groups', views.ListCreateGroup.as_view(), name='group-list'),
    # re_path('users/(?P<user_pk>\d+)/groups/(?P<pk>\d+)$',
    #         views.RetrieveUpdateDestroyGroup.as_view(), name='group-detail'),
    path('groups/<slug:name>', views.RetrieveUpdateDestroyGroup.as_view(), name='group-detail'),
    path('groups/<slug:name>/members', views.ListCreateMember.as_view(), name='member-list'),
    path('groups/<slug:name>/members/<int:pk>', views.RetrieveUpdateDestroyMember.as_view(), name='member-detail'),
    # re_path('groups/(?P<pk>\d+)/$', views.RetrieveUpdateDestroyCourse.as_view(), name='course-detail'),
    # path('groups/<uuid:pk>/join/', views.renew_book_librarian, name='renew-book-librarian'),
    # path('list', views.CourseListView.as_view(), name='course-list'),

]
