# Generated by Django 2.2.3 on 2019-08-07 06:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('esusu', '0007_auto_20190806_0419'),
    ]

    operations = [
        migrations.AddField(
            model_name='group',
            name='slug',
            field=models.CharField(max_length=255, null=True, unique=True),
        ),
        migrations.AlterField(
            model_name='group',
            name='amount',
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='group',
            name='name',
            field=models.CharField(max_length=55, unique=True),
        ),
        migrations.AlterField(
            model_name='member',
            name='id',
            field=models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]
