from django.test import TestCase
from django.urls import reverse
from rest_framework.test import APITestCase, APIClient
from rest_framework.views import status
from .models import User
from .serializers import UserSerializer


# Create your tests here.


class BaseViewTest(APITestCase):
    pass


class TestCreateUser(APITestCase):
    client = APIClient()

    def setUp(self):
        pass
        # self.username = 'john_doe'
        # self.password = 'foobar'
        # self.user = User.objects.create(username=self.username, password=self.password)
        # self.client.force_authenticate(user=self.user)

    def test_user_registration(self):
        response = self.client.post('/api/v1/users/',
                                    {"email": "mmm@g.vom",
                                        "first_name": "mike",
                                        "last_name": "",
                                        "password": "1234567",
                                        "profile": {
                                            "title": "",
                                            "dob": "2019-07-29",
                                            "address": "",
                                            "country": "",
                                            "city": ""
                                        }
                                    }
                                    , format='json')
        self.assertEquals(response.status_code, status.HTTP_201_CREATED)
        self.assertEquals(User.objects.get().first_name, 'mike')

    def test_get_all_user(self):
        response = self.client.get('/api/v1/users/')
        print(response.data)
        expected = User.objects.all()
        serialized = UserSerializer(expected, many=True)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data, serialized.data)

