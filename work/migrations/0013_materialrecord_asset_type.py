# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2024-05-02 10:37
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0012_auto_20240502_1802'),
    ]

    operations = [
        migrations.AddField(
            model_name='materialrecord',
            name='asset_type',
            field=models.IntegerField(choices=[(1, b'\xe8\x80\x97\xe6\x9d\x90'), (2, b'\xe5\x9b\xba\xe5\xae\x9a\xe8\xb5\x84\xe4\xba\xa7')], default=1, verbose_name='\u8d44\u4ea7\u7c7b\u578b'),
            preserve_default=False,
        ),
    ]
