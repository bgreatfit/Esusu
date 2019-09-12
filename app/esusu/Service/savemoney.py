
import datetime


class SaveMoney:
    time = datetime.datetime.now().strftime('%I:%M %p')
    day = datetime.datetime.now().day

    def __init__(self, savingPreference, account, transaction, savemoney_log):
        self.saving_preference = savingPreference
        self.account = account
        self.transaction = transaction
        self.savemoney_log = savemoney_log

    def get_saving_preference(self):
        try:
            savingprefs = self.saving_preference.objects.all()
        except self.saving_preference.DoesNotExist:
            savingprefs = None

        return savingprefs

    def save_money(self):
        pass

    def create_log(self, user, time, status, frequency):
        savemoney_log = self.savemoney_log.objects.create(user_id=user, time=time, status=status,
                                                          frequency=frequency)
        return savemoney_log

    def get_log(self, day_of_month, user_id, status):
        try:
            log = self.savemoney_log.objects.get(frequency=day_of_month,
                                                 user_id=user_id, time=self.time, status=status)
        except self.savemoney_log.DoesNotExist:
            log = None
        return log

    def store_transaction(self, periodic_amount, account):
        transaction = self.transaction.objects.create(amount=periodic_amount, account=account)
        return transaction
