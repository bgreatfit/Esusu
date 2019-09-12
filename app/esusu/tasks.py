import logging
import datetime
from celery.schedules import crontab
from django.shortcuts import get_object_or_404
from django.template import Template, Context
from django.urls import reverse
from django.core.mail import send_mail
from django.contrib.auth import get_user_model

from .views import TransactionViewSet
from celery import shared_task
from cowrywise.celery import app
from .models import Account, User, Transaction, SavingPreference, SaveMoneyLog

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
    day = datetime.datetime.now().day
    # now.year, now.month, now.day, now.hour, now.minute, now.second


    print('begin now')
    # user_model = get_user_model()
    #
    # users = user_model.objects.all()
    savingprefs = SavingPreference.objects.all()
    time = datetime.datetime.now().strftime('%I:%M %p')
    # print(time)
    # for savingpref in savingprefs:
    #     print(savingpref.time.strftime('%I:%M %p') == time)
    #     print("{0} == {1} {2} == {3}, {4}".
    #           format(savingpref.day_of_month, day, savingpref.time.strftime('%I:%M %p'), time, savingpref.status))

    if savingprefs:
        for savingpref in savingprefs:
            # try:
            #     log = SaveMoneyLog.objects.get_or_create(frequency=savingpref.day_of_month,
            #                                              user_id=savingpref.user_id, time=time)
            print('here')
            if savingpref.day_of_month == day and savingpref.time.strftime('%I:%M %p') == time \
                    and savingpref.status == '1':
                print('start')
                try:
                    log = SaveMoneyLog.objects.get(frequency=savingpref.day_of_month,
                                                   user_id=savingpref.user_id, time=time, status=1)
                except SaveMoneyLog.DoesNotExist:
                    log = None
                if log is None:
                    print('no log')
                    user = savingpref.user_id
                    account = get_object_or_404(Account, user_id=user)
                    balance = account.balance
                    periodic_amount = savingpref.periodic_amount
                    print("bal{0}, period {1}".format(balance, periodic_amount))

                    account.balance = (balance - periodic_amount)
                    account.save()
                    transaction = Transaction.objects.create(amount=savingpref.periodic_amount, account=account)
                    print('transaction')
                    if transaction:
                        SaveMoneyLog.objects.create(user_id=user, time=time, status=1,
                                                    frequency=savingpref.day_of_month)
                    print('done')




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
