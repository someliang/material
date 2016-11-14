# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('work', '0006_auto_20161109_1737'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='material',
            name='now_count',
        ),
    ]
