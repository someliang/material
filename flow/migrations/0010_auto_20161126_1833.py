# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0009_auto_20161125_2007'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='addmaterial',
            options={'verbose_name': '\u8017\u6750\u5165\u5e93', 'verbose_name_plural': '\u8017\u6750\u5165\u5e93', 'permissions': ('list_add_material', 'can list added material')},
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 26, 10, 33, 3, 441672, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
