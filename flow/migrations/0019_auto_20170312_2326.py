# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0018_auto_20170121_2101'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2017, 3, 12, 15, 26, 13, 428360, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applybuymaterial',
            name='ps',
            field=models.TextField(verbose_name='\u5907\u6ce8', blank=True),
        ),
        migrations.AlterField(
            model_name='applybuymaterial',
            name='total',
            field=models.DecimalField(default=1.0, verbose_name='\u603b\u4ef7', max_digits=20, decimal_places=2),
        ),
    ]
