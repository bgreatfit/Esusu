# Generated by Django 2.2.3 on 2019-08-13 05:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('esusu', '0008_auto_20190807_0602'),
    ]

    operations = [
        migrations.RenameField(
            model_name='group',
            old_name='amount',
            new_name='max_amount',
        ),
    ]
