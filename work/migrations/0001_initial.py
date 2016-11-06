# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Material',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=30, verbose_name='material name')),
                ('unit', models.CharField(max_length=30, verbose_name='material unit')),
            ],
            options={
                'verbose_name': 'material',
                'verbose_name_plural': 'material',
            },
        ),
    ]
