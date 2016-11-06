# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('work', '0002_classroom'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=32, verbose_name='\u540d\u79f0')),
                ('user', models.OneToOneField(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'user profile',
                'verbose_name_plural': 'user profile',
            },
        ),
        migrations.AlterModelOptions(
            name='material',
            options={'verbose_name': '\u8017\u6750', 'verbose_name_plural': '\u8017\u6750'},
        ),
        migrations.AlterField(
            model_name='classroom',
            name='admin',
            field=models.ForeignKey(to='work.UserProfile'),
        ),
        migrations.AlterField(
            model_name='material',
            name='name',
            field=models.CharField(max_length=30, verbose_name='\u540d\u79f0'),
        ),
        migrations.AlterField(
            model_name='material',
            name='unit',
            field=models.CharField(max_length=30, verbose_name='\u5355\u4f4d'),
        ),
    ]
