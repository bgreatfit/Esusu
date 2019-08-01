import uuid
import random

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.conf import settings

# Create your models here.


class User(AbstractUser):
    username = models.CharField(max_length=50, blank=True, null=True, help_text="enter username")
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    def __str__(self):
        return f'{self.email}'


class UserProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,
                                related_name='profile')
    title = models.CharField(max_length=5, blank=True, null=True)
    dob = models.DateField(auto_created=True, blank=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=50, blank=True, null=True)
    photo = models.ImageField(upload_to='uploads', blank=True, null=True)


class Group(models.Model):
    """ Model representing a book """
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    description = models.TextField(max_length=1000, help_text='Enter a brief description of this group')
    max_number = models.IntegerField()

    def create_random_slot(self):
        total_slot = self.max_number
        my_randoms = random.sample(range(1, total_slot), total_slot)
        return tuple(my_randoms)

    slot = models.CharField(max_length=255, default=create_random_slot)
    is_searchable = models.CharField(max_length=1, default=1)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.description

    def get_absolute_url(self):
        return reverse('esusu:group-detail', args=[str(self.id)])
    #
    # def display_genre(self):
    #     """Create a string for the Genre. This is required to display genre in Admin."""
    #     return ', '.join(genre.name for genre in self.genre.all()[:3])
    #
    # display_genre.short_description = 'Genre'


class GroupInstance(models.Model):

    """Model representing a specific copy of a book (i.e. that can be borrowed from the library)."""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                          help_text="Unique ID for this particular book across whole library")
    group = models.ForeignKey(Group, on_delete=models.SET_NULL, null=True)
    member = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True)
    rank = models.IntegerField(null=True)
    contribution = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

