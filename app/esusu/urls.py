from django.urls import path, re_path
from . import views

urlpatterns = [
    path('groups/search', views.search, name='group-list'),
    path('groups/<str:link>/join', views.join, name='group-join'),
    path('groups', views.ListCreateGroup.as_view(), name='group-list'),
    path('groups/<int:pk>', views.RetrieveUpdateDestroyGroup.as_view(), name='group-detail'),
    path('groups/<int:group_pk>/members', views.ListCreateMember.as_view(), name='member-list'),
    path('groups/<int:group_pk>/members/<int:pk>', views.RetrieveUpdateDestroyMember.as_view(), name='member-detail'),
    # re_path('groups/(?P<pk>\d+)/$', views.RetrieveUpdateDestroyCourse.as_view(), name='course-detail'),
    # path('groups/<uuid:pk>/join/', views.renew_book_librarian, name='renew-book-librarian'),
    # path('list', views.CourseListView.as_view(), name='course-list'),

]
