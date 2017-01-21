# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0013_auto_20170121_2028'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2017, 1, 21, 12, 29, 13, 285929, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
