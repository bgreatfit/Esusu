# Generated by Django 2.2.3 on 2019-09-02 07:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('esusu', '0016_user_amount'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='amount',
            new_name='contribution',
        ),
    ]
