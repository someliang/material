# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0007_remove_material_now_count'),
        ('flow', '0006_auto_20161122_1923'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='applymaterial',
            name='material_info',
        ),
        migrations.AddField(
            model_name='applymaterial',
            name='class_room',
            field=models.ForeignKey(default=1, verbose_name='\u95e8\u724c\u53f7', to='work.ClassRoom'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='applymaterial',
            name='material',
            field=models.ForeignKey(default=1, verbose_name='\u8017\u6750\u540d\u79f0', to='work.Material'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 22, 11, 50, 51, 57980, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
