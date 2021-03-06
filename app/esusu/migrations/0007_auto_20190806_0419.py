# Generated by Django 2.2.3 on 2019-08-06 04:19

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('esusu', '0006_auto_20190802_0629'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='amount',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
        migrations.AlterField(
            model_name='group',
            name='is_searchable',
            field=models.CharField(choices=[('1', 'YES'), ('0', 'NO')], max_length=1),
        ),
        migrations.AlterField(
            model_name='group',
            name='name',
            field=models.CharField(max_length=255, unique=True),
        ),
        migrations.AlterField(
            model_name='member',
            name='contribution',
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='member',
            name='rank',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='member',
            name='user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='members', to=settings.AUTH_USER_MODEL),
        ),
        migrations.DeleteModel(
            name='UserProfile',
        ),
    ]
