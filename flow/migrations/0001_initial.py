# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0005_auto_20161107_2256'),
    ]

    operations = [
        migrations.CreateModel(
            name='AddMaterial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('now_number', models.IntegerField(default=0, verbose_name='\u5269\u4f59\u6570\u91cf')),
                ('add_number', models.IntegerField(default=0, verbose_name='\u5165\u5e93\u6570\u91cf')),
                ('class_room', models.ForeignKey(verbose_name='\u95e8\u724c\u53f7', to='work.ClassRoom')),
                ('material', models.ForeignKey(verbose_name='\u540d\u79f0', to='work.Material')),
            ],
            options={
                'verbose_name': '\u8017\u6750\u5165\u5e93',
                'verbose_name_plural': '\u8017\u6750\u5165\u5e93',
            },
        ),
    ]
