# Generated by Django 2.2.3 on 2019-08-27 06:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('esusu', '0012_auto_20190827_0610'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(help_text='enter username', max_length=50),
        ),
    ]
