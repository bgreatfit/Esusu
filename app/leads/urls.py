from . import views
from django.urls import path

urlpatterns = [
    path('', views.LeadListCreate.as_view()),
]
