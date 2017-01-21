# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0009_auto_20170121_2034'),
    ]

    operations = [
        migrations.AlterField(
            model_name='material',
            name='price',
            field=models.DecimalField(default=1.0, verbose_name='\u8017\u6750\u5355\u4ef7', max_digits=20, decimal_places=2),
        ),
        migrations.AlterField(
            model_name='material',
            name='standard',
            field=models.CharField(default=None, max_length=30, verbose_name='\u8017\u6750\u89c4\u683c'),
        ),
        migrations.AlterField(
            model_name='material',
            name='unit',
            field=models.CharField(max_length=30, verbose_name='\u8017\u6750\u5355\u4f4d'),
        ),
    ]
