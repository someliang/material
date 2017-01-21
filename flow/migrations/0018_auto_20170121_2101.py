# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0017_auto_20170121_2050'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='applymaterial',
            name='ps',
        ),
        migrations.RemoveField(
            model_name='applymaterial',
            name='total',
        ),
        migrations.AddField(
            model_name='applybuymaterial',
            name='ps',
            field=models.TextField(verbose_name='apply material ps', blank=True),
        ),
        migrations.AddField(
            model_name='applybuymaterial',
            name='total',
            field=models.DecimalField(default=1.0, verbose_name='apply material total', max_digits=20, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2017, 1, 21, 13, 1, 23, 770882, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
