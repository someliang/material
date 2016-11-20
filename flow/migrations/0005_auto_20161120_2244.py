# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.conf import settings
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0004_auto_20161117_0956'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='applymaterial',
            options={'verbose_name': '\u8017\u6750\u4f7f\u7528\u7533\u8bf7', 'verbose_name_plural': '\u8017\u6750\u4f7f\u7528\u7533\u8bf7'},
        ),
        migrations.RemoveField(
            model_name='applymaterial',
            name='class_room',
        ),
        migrations.RemoveField(
            model_name='applymaterial',
            name='material',
        ),
        migrations.AddField(
            model_name='applymaterial',
            name='material_info',
            field=models.ForeignKey(default=1, verbose_name='\u8017\u6750\u4fe1\u606f', to='flow.InitMaterial'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 20, 14, 44, 16, 601616, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='applicant',
            field=models.OneToOneField(editable=False, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='apply_time',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\u7533\u8bf7\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='is_agree',
            field=models.BooleanField(default=False, verbose_name='\u662f\u5426\u901a\u8fc7'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='number',
            field=models.IntegerField(default=0, verbose_name='\u7533\u8bf7\u6570\u91cf'),
        ),
    ]
