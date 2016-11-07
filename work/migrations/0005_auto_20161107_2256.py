# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0004_auto_20161107_2215'),
    ]

    operations = [
        migrations.AlterField(
            model_name='material',
            name='now_count',
            field=models.IntegerField(default=0, verbose_name='\u5269\u4f59\u6570\u91cf'),
        ),
    ]
