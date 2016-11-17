# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings
from django.utils.timezone import utc
import datetime


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('work', '0007_remove_material_now_count'),
        ('flow', '0003_auto_20161115_1828'),
    ]

    operations = [
        migrations.CreateModel(
            name='ApplyMaterial',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('number', models.IntegerField(default=0, verbose_name='apply use number')),
                ('is_agree', models.BooleanField(default=False, verbose_name='apply status')),
                ('apply_time', models.DateTimeField(auto_now_add=True, verbose_name='apply time')),
                ('applicant', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
                ('class_room', models.ForeignKey(verbose_name='apply material class room number', to='work.ClassRoom')),
                ('material', models.ForeignKey(verbose_name='apply material material name', to='work.Material')),
            ],
            options={
                'verbose_name': 'apply material for teacher',
                'verbose_name_plural': 'apply material for teacher',
            },
        ),
        migrations.AlterModelOptions(
            name='initmaterial',
            options={'verbose_name': '\u521d\u59cb\u8017\u6750', 'verbose_name_plural': '\u521d\u59cb\u8017\u6750'},
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='add_time',
            field=models.DateTimeField(default=datetime.datetime(2016, 11, 17, 1, 56, 9, 75681, tzinfo=utc), verbose_name='\u5165\u5e93\u65f6\u95f4'),
        ),
        migrations.AlterField(
            model_name='addmaterial',
            name='material_info',
            field=models.ForeignKey(verbose_name='\u8017\u6750\u4fe1\u606f', to='flow.InitMaterial'),
        ),
        migrations.AlterField(
            model_name='initmaterial',
            name='stocks',
            field=models.IntegerField(default=0, verbose_name='\u5e93\u5b58'),
        ),
    ]
