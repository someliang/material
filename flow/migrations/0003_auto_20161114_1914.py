# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import datetime
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0007_remove_material_now_count'),
        ('flow', '0002_auto_20161109_1737'),
    ]

    operations = [
        migrations.CreateModel(
            name='InitMaterial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('stocks', models.IntegerField(default=0, verbose_name='stock material number')),
                ('class_room', models.ForeignKey(verbose_name='\u95e8\u724c\u53f7', to='work.ClassRoom')),
                ('material', models.ForeignKey(verbose_name='\u8017\u6750\u540d\u79f0', to='work.Material')),
            ],
            options={
                'verbose_name': 'init material',
                'verbose_name_plural': 'init material',
            },
        ),
        migrations.RemoveField(
            model_name='addmaterial',
            name='class_room',
        ),
        migrations.RemoveField(
            model_name='addmaterial',
            name='material',
        ),
        migrations.RemoveField(
            model_name='addmaterial',
            name='now_number',
        ),
        migrations.AddField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 14, 11, 13, 36, 867319, tzinfo=utc), verbose_name='add time'),
        ),
        migrations.AddField(
            model_name='addmaterial',
            name='material_info',
            field=models.ForeignKey(default=datetime.datetime(2016, 11, 14, 11, 14, 15, 528552, tzinfo=utc), verbose_name='material info', to='flow.InitMaterial'),
            preserve_default=False,
        ),
    ]
