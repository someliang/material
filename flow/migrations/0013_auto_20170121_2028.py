# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0012_auto_20161130_2055'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2017, 1, 21, 12, 27, 33, 826643, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='class_room',
            field=models.ForeignKey(verbose_name='\u5165\u5e93\u6559\u5ba4', to='work.ClassRoom'),
        ),
    ]
