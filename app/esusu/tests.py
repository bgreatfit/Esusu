from django.test import TestCase
from django.urls import reverse
from rest_framework.test import APITestCase, APIClient
from rest_framework.views import status
from .models import User
from .serializers import UserSerializer

# Create your tests here.


class BaseViewTest(APITestCase):

    client = APIClient()

    def setUp(self):
        

