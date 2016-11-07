# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0003_auto_20161106_2145'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='classroom',
            options={'verbose_name': '\u5b9e\u8bad\u5ba4', 'verbose_name_plural': '\u5b9e\u8bad\u5ba4'},
        ),
        migrations.AlterModelOptions(
            name='userprofile',
            options={'verbose_name': '\u7528\u6237\u8be6\u60c5', 'verbose_name_plural': '\u7528\u6237\u8be6\u60c5'},
        ),
        migrations.AddField(
            model_name='material',
            name='now_count',
            field=models.IntegerField(default=0, verbose_name='material now count'),
        ),
        migrations.AlterField(
            model_name='classroom',
            name='number',
            field=models.CharField(max_length=30, verbose_name='\u95e8\u724c\u53f7'),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='name',
            field=models.CharField(max_length=32, verbose_name='\u59d3\u540d'),
        ),
    ]
