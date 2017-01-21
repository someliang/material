# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0016_auto_20170121_2034'),
    ]

    operations = [
        migrations.AddField(
            model_name='applymaterial',
            name='ps',
            field=models.TextField(verbose_name='apply material ps', blank=True),
        ),
        migrations.AddField(
            model_name='applymaterial',
            name='total',
            field=models.DecimalField(default=1.0, verbose_name='apply material total', max_digits=20, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2017, 1, 21, 12, 50, 43, 394464, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applybuymaterial',
            name='unit',
            field=models.CharField(max_length=32, verbose_name='\u8017\u6750\u5355\u4f4d'),
        ),
    ]
