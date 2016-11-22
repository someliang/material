# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.conf import settings
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0005_auto_20161120_2244'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 22, 11, 23, 21, 498745, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='applicant',
            field=models.ForeignKey(verbose_name='applicant', to=settings.AUTH_USER_MODEL),
        ),
    ]
