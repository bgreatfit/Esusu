from django.shortcuts import render
from rest_framework import generics
from . serializer import LeadSerializer
from . models import Lead


class LeadListCreate(generics.ListCreateAPIView):
    queryset = Lead.objects.all()
    serializer_class = LeadSerializer



# Create your views here.
