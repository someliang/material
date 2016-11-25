# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0008_auto_20161123_0840'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='applybuymaterial',
            options={'verbose_name': '\u8d2d\u4e70\u8017\u6750\u7533\u8bf7', 'verbose_name_plural': '\u8d2d\u4e70\u8017\u6750\u7533\u8bf7'},
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 25, 12, 7, 22, 67256, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
