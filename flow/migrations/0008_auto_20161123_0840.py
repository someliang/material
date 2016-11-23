# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.utils.timezone import utc
import datetime
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('work', '0007_remove_material_now_count'),
        ('flow', '0007_auto_20161122_1950'),
    ]

    operations = [
        migrations.CreateModel(
            name='ApplyBuyMaterial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('number', models.IntegerField(default=0, verbose_name='\u7533\u8bf7\u6570\u91cf')),
                ('unit', models.CharField(max_length=32, verbose_name='\u5355\u4f4d')),
                ('is_agree', models.BooleanField(default=False, verbose_name='\u662f\u5426\u901a\u8fc7')),
                ('apply_time', models.DateTimeField(auto_now_add=True, verbose_name='\u7533\u8bf7\u65f6\u95f4')),
                ('applicant', models.ForeignKey(verbose_name='\u7533\u8bf7\u4eba', to=settings.AUTH_USER_MODEL)),
                ('class_room', models.ForeignKey(verbose_name='\u4f7f\u7528\u6559\u5ba4', to='work.ClassRoom')),
                ('material', models.ForeignKey(verbose_name='\u8017\u6750\u540d\u79f0', to='work.Material')),
            ],
            options={
                'verbose_name': 'apply buy material',
                'verbose_name_plural': 'apply buy material',
            },
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 23, 0, 40, 56, 727894, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='applicant',
            field=models.ForeignKey(verbose_name='\u7533\u8bf7\u4eba', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='applymaterial',
            name='class_room',
            field=models.ForeignKey(verbose_name='\u4f7f\u7528\u6559\u5ba4', to='work.ClassRoom'),
        ),
    ]
