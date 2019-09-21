import datetime
from django.shortcuts import get_object_or_404
from django.utils.translation import gettext as _


class SaveMoneyFailed(Exception):
    pass


class AccountTransaction:

    def __init__(self, account, transaction, log):
        # now.year, now.month, now.day, now.hour, now.minute, now.second
        self.current_time = datetime.datetime.now().strftime('%I:%M %p')
        self.current_day = datetime.datetime.now().day
        self.account = account
        self.transaction = transaction
        self.log = log

    def save_money(self, preference):
        account = self.withdraw_money_from_account(preference)
        transaction = self.store_transaction(preference, account)
        if transaction and account:
            log = self.create_log(preference)

            return log
        error_msg = (
            'An error occurred while saving money into  {} acount. '
            'Please, try again'
        ).format(account)

        raise SaveMoneyFailed(_(error_msg))

    def withdraw_money_from_account(self, preference):
        try:
            account = self.get_account(preference.user_id)
            account.balance -= preference.periodic_amount
            account.save()
        except self.account.DoesNotExist:
            print('Account Does Not Exist')
        else:
            return account

    def create_log(self, preference):
        save_money_log = self.log.objects.create(user_id=preference.user_id, time=self.current_time, status=preference.status,
                                                 frequency=preference.day_of_month)
        return save_money_log

    def has_log(self, preference):
        try:
            log = self.log.objects.get(frequency=preference.day_of_month,
                                       user_id=preference.user_id, time=self.current_time, status=preference.status)

        except self.log.DoesNotExist:
            log = None
        return log

    def get_account(self, user_id):
        try:
            account = get_object_or_404(self.account, user_id=user_id)
        except self.account.DoesNotExist:
            account = None
        return account

    def store_transaction(self, preference, account):
        # update transaction after withdrawal
        transaction = self.transaction.objects.create(amount=preference.periodic_amount, account=account)
        return transaction

    def is_cron_schedule(self, preference):
        preference_time = preference.time.strftime('%I:%M %p')
        if preference.day_of_month == self.current_day and preference_time == self.current_time \
                and preference.status == '1':
            return True
        return None
