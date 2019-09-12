import logging
import datetime
from celery.schedules import crontab
from django.template import Template, Context
from django.urls import reverse
from django.core.mail import send_mail
from django.contrib.auth import get_user_model

from .views import TransactionViewSet
from celery import shared_task
from cowrywise.celery import app
from .models import User, Account, Transaction, SavingPreference

#
# # from esusu.models import Account, Transaction

#
@shared_task
def hello():
    print("Hello !")
    print("Hello Mike!")

#
# # #
# # #
@shared_task
def save_money():
    now = datetime.datetime.now()
    # now.year, now.month, now.day, now.hour, now.minute, now.second
    print(now)
    print('here')
    #user_model = get_user_model()

    saving_prefs = SavingPreference.objects.all()
    if saving_prefs:
        for saving_pref in saving_prefs:
            try:
                if saving_pref.user:
                    if saving_pref.day_of_month == now.day and saving_pref.time == now.hour \
                            and saving_pref.status == '1':
                        account = Account.objects.get(user_id=saving_pref.user.id)
                        account.amount -= saving_pref.periodic_amount
                        account.save()

                        Transaction.objects.create(amount=saving_pref.periodic_amount)
            except saving_pref.DoesNotExist:
                logging.warning("Tried to send withdraw '%d' from user '%s'" %
                                saving_pref.periodic_amount, saving_pref.user.email)


# #
# @app.task
# def send_verification_email(user_id):
#     UserModel = get_user_model()
#     try:
#         user = UserModel.objects.get(pk=user_id)
#         send_mail(
#             'Verify your Esusu account',
#             'Follow this link to verify your account: '
#             'http://localhost:8000%s' % reverse('verify', kwargs={'uuid': str(user.verification_uuid)}),
#             'from@esusu.dev',
#             [user.email],
#             fail_silently=False,
#         )
#     except UserModel.DoesNotExist:
#         logging.warning("Tried to send verification email to non-existing user '%s'" % user_id)

#
# REPORT_TEMPLATE = """
# Here's how you did till now:
#
# {% for post in posts %}
#         "{{ post.title }}": viewed {{ post.view_count }} times |
#
# {% endfor %}
# """
#
#
# # @app.task
# # def send_view_count_report():
# #     for user in get_user_model().objects.all():
# #         posts = Post.objects.filter(author=user)
# #         if not posts:
# #             continue
# #
# #         template = Template(REPORT_TEMPLATE)
# #
# #         send_mail(
# #             'Your QuickPublisher Activity',
# #             template.render(context=Context({'posts': posts})),
# #             'from@quickpublisher.dev',
# #             [user.email],
# #             fail_silently=False,
# #         )
