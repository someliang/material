# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2024-05-01 16:22
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0019_auto_20170312_2326'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='addmaterial',
            name='class_room',
        ),
        migrations.RemoveField(
            model_name='addmaterial',
            name='material',
        ),
        migrations.RemoveField(
            model_name='applybuymaterial',
            name='applicant',
        ),
        migrations.RemoveField(
            model_name='applybuymaterial',
            name='class_room',
        ),
        migrations.RemoveField(
            model_name='applybuymaterial',
            name='material',
        ),
        migrations.RemoveField(
            model_name='applymaterial',
            name='applicant',
        ),
        migrations.RemoveField(
            model_name='applymaterial',
            name='class_room',
        ),
        migrations.RemoveField(
            model_name='applymaterial',
            name='material',
        ),
        migrations.RemoveField(
            model_name='initmaterial',
            name='class_room',
        ),
        migrations.RemoveField(
            model_name='initmaterial',
            name='material',
        ),
        migrations.DeleteModel(
            name='AddMaterial',
        ),
        migrations.DeleteModel(
            name='ApplyBuyMaterial',
        ),
        migrations.DeleteModel(
            name='ApplyMaterial',
        ),
        migrations.DeleteModel(
            name='InitMaterial',
        ),
    ]
