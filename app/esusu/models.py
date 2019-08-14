import uuid
import random

from django.db import models
from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from django.dispatch import receiver
from django.db.models.signals import post_save

# Create your models here.


class User(AbstractUser):
    username = models.CharField(max_length=50, help_text="enter username", unique=True)
    email = models.EmailField(_('email address'), unique=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    def __str__(self):
        return f'{self.email}'


# class UserProfile(models.Model):
#     user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE,
#                                 related_name='profile')
#     title = models.CharField(max_length=5, blank=True, null=True)
#     dob = models.DateField(auto_created=True, blank=True)
#     address = models.CharField(max_length=255, blank=True, null=True)
#     country = models.CharField(max_length=50, blank=True, null=True)
#     city = models.CharField(max_length=50, blank=True, null=True)
#     photo = models.ImageField(upload_to='uploads', blank=True, null=True)


class Group(models.Model):
    """ Model representing a book """
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    description = models.TextField(max_length=1000, help_text='Enter a brief description of this group')
    name = models.CharField(max_length=55, unique=True, blank=False)
    max_number = models.IntegerField()
    max_amount = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    slot = models.CharField(max_length=255, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    IS_SEARCHABLE = (
        ('1', 'YES'),
        ('0', 'NO')
    )
    
    is_searchable = models.CharField(max_length=1, choices=IS_SEARCHABLE)

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('esusu:group-detail', args=[str(self.id)])

    def create_random_slot(self):
        total_slot = self.max_number
        my_randoms = random.sample(range(1, total_slot + 1), total_slot)
        print(my_randoms)
        return my_randoms


# @receiver(post_save, sender=Group)
# def create_member(sender, instance, created, **kwargs):
#     print(f'Here Now {sender}, {instance}, {created}')
#     if created:
#         Member.objects.create(group=instance,
#                               user_id=instance.user_id,
#                               )

#signals.post_save.connect(receiver=create_customer, sender=Customer)
    # def save(self, *args, **kwargs):
    #     print(self)
    #     print(kwargs)
    #     Member.objects.create(group=self.pk,
    #                           user=self.user,
    #                           )
    #     super(Group, self).save(*args, **kwargs)
    # def save(self, *args, **kwargs):
    #     random_slot = self.create_random_slot()
    #     self.slot = random_slot
    #     super(Group, self).save(*args, **kwargs)


class Member(models.Model):
    """Model representing a specific copy of a book (i.e. that can be borrowed from the library)."""
    # id = models.UUIDField(primary_key=True, default=uuid.uuid4,
    #                       help_text="Unique ID for this particular book across whole library")
    group = models.ForeignKey(Group, related_name='members', on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, related_name="members")
    rank = models.IntegerField(null=True, blank=True)
    contribution = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


