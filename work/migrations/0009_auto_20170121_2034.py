# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0008_auto_20161125_2007'),
    ]

    operations = [
        migrations.AddField(
            model_name='material',
            name='price',
            field=models.DecimalField(default=1.0, verbose_name='material price', max_digits=20, decimal_places=2),
        ),
        migrations.AddField(
            model_name='material',
            name='standard',
            field=models.CharField(default=None, max_length=30, verbose_name='material standard'),
        ),
    ]
