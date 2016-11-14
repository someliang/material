# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0005_auto_20161107_2256'),
    ]

    operations = [
        migrations.AlterField(
            model_name='material',
            name='name',
            field=models.CharField(max_length=30, verbose_name='\u8017\u6750\u540d\u79f0'),
        ),
    ]
