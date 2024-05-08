# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2024-05-08 10:37
from __future__ import unicode_literals

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('flow', '0026_auto_20240506_1147'),
    ]

    operations = [
        migrations.CreateModel(
            name='ApplyMaterial',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.IntegerField(default=0, verbose_name='apply use number')),
                ('is_agree', models.BooleanField(default=False, verbose_name='\u662f\u5426\u901a\u8fc7')),
                ('agree_time', models.DateTimeField(default=None, verbose_name='\u7533\u8bf7\u65f6\u95f4')),
                ('apply_time', models.DateTimeField(auto_now_add=True, verbose_name='\u7533\u8bf7\u65f6\u95f4')),
                ('applicant', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='\u7533\u8bf7\u4eba')),
                ('buy_material_process', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='flow.ApplyBuyMaterialProcess', verbose_name='buy material process')),
            ],
            options={
                'verbose_name': 'apply material for teacher',
                'verbose_name_plural': 'apply material for teacher',
            },
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2024, 5, 8, 10, 37, 27, 761440, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
