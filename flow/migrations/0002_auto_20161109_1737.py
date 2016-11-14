# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('flow', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='addmaterial',
            name='material',
            field=models.ForeignKey(verbose_name='\u8017\u6750\u540d\u79f0', to='work.Material'),
        ),
    ]
