# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0008_auto_20161125_2007'),
        ('flow', '0011_auto_20161126_1834'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='addmaterial',
            options={'verbose_name': '\u8017\u6750\u5165\u5e93', 'verbose_name_plural': '\u8017\u6750\u5165\u5e93'},
        ),
        migrations.AlterModelOptions(
            name='applybuymaterial',
            options={'verbose_name': '\u8017\u6750\u8d2d\u4e70\u7533\u8bf7', 'verbose_name_plural': '\u8017\u6750\u8d2d\u4e70\u7533\u8bf7'},
        ),
        migrations.AlterModelOptions(
            name='initmaterial',
            options={'verbose_name': '\u8017\u6750\u5e93\u5b58', 'verbose_name_plural': '\u8017\u6750\u5e93\u5b58'},
        ),
        migrations.RemoveField(
            model_name='addmaterial',
            name='material_info',
        ),
        migrations.AddField(
            model_name='addmaterial',
            name='class_room',
            field=models.ForeignKey(default=1, verbose_name='add material room number', to='work.ClassRoom'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='addmaterial',
            name='material',
            field=models.ForeignKey(default=1, verbose_name='\u8017\u6750\u540d\u79f0', to='work.Material'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 30, 12, 55, 18, 375952, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
    ]
