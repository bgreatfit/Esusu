import uuid
import random

from django.contrib.auth import signals
from django.db import models
from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.utils.translation import ugettext_lazy as _
from django.conf import settings
from django.dispatch import receiver
from django.db.models.signals import post_save, pre_save
from django.utils.crypto import get_random_string
from django.core.mail import send_mail



from rest_framework.reverse import reverse


# Create your models here.


class User(AbstractUser):
    username = models.CharField(max_length=50, help_text="enter username")
    email = models.EmailField(_('email address'), unique=True)
    is_verified = models.BooleanField('verified', default=False)  # Add the `is_verified` flag
    verification_uuid = models.UUIDField('Unique Verification UUID', default=uuid.uuid4)
    pay_freq = models.CharField('Payment Frequency', max_length=1, default='D')
    contribution = models.DecimalField(max_digits=10, decimal_places=2, default=10000)


    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    def __str__(self):
        return f'{self.email}'


def user_post_save(sender, instance, created, *args, **kwargs):
    if created:
        Account.objects.create(user=instance)
    if not instance.is_verified:
        pass
        #from .tasks import send_verification_email
        # Send verification email
       # send_verification_email.delay(instance.pk)


post_save.connect(user_post_save, sender=User)


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
    max_amount = models.DecimalField(max_digits=10, decimal_places=2, null=False, blank=True)

    def create_link():
        return get_random_string(length=15)

    share_link = models.CharField(max_length=15, unique=True, blank=True, null=True, default=create_link)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    IS_SEARCHABLE = (
        ('1', 'YES'),
        ('0', 'NO')
    )
    
    is_searchable = models.CharField(max_length=1, choices=IS_SEARCHABLE)
    #
    # class Meta:
    #     def clean_name(self):
    #         return self.cleaned_data["name"].upper()

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('esusu:group-detail', args=[str(self.id)])

    def create_random_slot(self):
        total_slot = self.max_number
        my_randoms = random.sample(range(1, total_slot + 1), total_slot)
        return my_randoms


@receiver(pre_save, sender=Group)
def to_lower(sender, instance, *args, **kwargs):
    if instance.name:
        instance.name = instance.name.lower()


@receiver(post_save, sender=Group)
def group_instance(sender, instance, created, **kwargs):
    if created:
        Member.objects.create(group=instance, user=instance.user, contribution=instance.max_amount)


class Member(models.Model):
    group = models.ForeignKey(Group, related_name='members', on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, related_name="members")
    rank = models.IntegerField(null=True, blank=True)
    contribution = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class SavePreference(models.Model):
    user = models.OneToOneField(User, related_name='savingspref', on_delete=models.CASCADE, null=False)
    periodic_amount = models.DecimalField(max_digits=14, decimal_places=2, default=500000, blank=False, null=False)
    FREQUENCY = (
        ('D', 'Daily'),
        ('W', 'Weekly'),
        ('M', 'Monthly')
    )
    frequency = models.CharField('Frequency', max_length=1, choices=FREQUENCY)
    STATUS = (
        ('1', 'Active'),
        ('0', 'Pause')
    )
    status = models.CharField('Status', max_length= 1, choices=STATUS)
    day_of_month = models.IntegerField('Day', blank=False, null=True)
    time = models.TimeField('Time')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.user.username


class SaveMoneyLog(models.Model):
    user = models.ForeignKey(User, related_name='save_logs', on_delete=models.CASCADE, null=False)
    time = models.TimeField('time')
    STATUS = (
        ('1', 'YES'),
        ('0', 'NO')
    )
    frequency = models.CharField('Frequency', max_length=1, null=True, blank=False)
    status = models.IntegerField('Status', max_length=1, choices=STATUS)


class AccountManager(models.Manager):
    def count_account_type(self, account_type):
        return self.filter(name__icontains=account_type).count()


class Account(models.Model):

    user = models.ForeignKey(User, related_name='accounts', on_delete=models.CASCADE, null=False)
    id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                                      help_text="User's Account Number")
    balance = models.DecimalField(max_digits=14, decimal_places=2, default=500000, blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    objects = AccountManager()

    def __str__(self):
        return self.user.username


class Transaction(models.Model):
    trans_id = models.UUIDField(primary_key=True, default=uuid.uuid4,
                                help_text="User's Account Number")
    account = models.ForeignKey(Account, related_name='transactions', on_delete=models.SET_NULL, null=True)
    amount = models.DecimalField(max_digits=14, decimal_places=2)
    #trans_class = models.CharField(max_digits=14)
    def generate_reference():
        random_string = get_random_string(length=5)
        return 'REF'+random_string
    receipt_no = models.CharField(max_length=15, default=generate_reference)
    trans_type = models.CharField(max_length=15, default='test')
    trans_date = models.DateTimeField(auto_now_add=True)
    response = models.TextField(max_length=100, default='Success')




