from . import views
from django.urls import path

urlpatterns = [
    path('', views.LeadListCreate.as_view()),
    path('<int:pk>', views.LeadRetrieveUpdateDestroy.as_view(), name='lead-detail'),
]
