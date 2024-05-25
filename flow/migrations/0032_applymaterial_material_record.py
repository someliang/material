# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2024-05-24 08:58
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0015_auto_20240510_1842'),
        ('flow', '0031_auto_20240511_1814'),
    ]

    operations = [
        migrations.AddField(
            model_name='applymaterial',
            name='material_record',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='work.MaterialRecord', verbose_name='\u8017\u6750\u540d\u79f0'),
        ),
    ]