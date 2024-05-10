# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2024-05-10 09:22
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0027_auto_20240508_1837'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='applymaterial',
            options={'verbose_name': '\u8017\u6750\u9886\u7528\u7533\u8bf7', 'verbose_name_plural': '\u8017\u6750\u9886\u7528\u7533\u8bf7'},
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2024, 5, 10, 9, 22, 27, 750855, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='agree_time',
            field=models.DateTimeField(blank=True, null=True, verbose_name='\u7533\u8bf7\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='buy_material_process',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='flow.ApplyBuyMaterialProcess', verbose_name='\u8017\u6750\u8d2d\u4e70\u6d41\u7a0b'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='number',
            field=models.IntegerField(default=0, verbose_name='\u7533\u8bf7\u9886\u7528\u6570\u91cf'),
        ),
    ]
