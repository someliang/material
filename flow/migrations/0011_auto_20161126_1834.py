# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0010_auto_20161126_1833'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 26, 10, 34, 17, 235089, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
