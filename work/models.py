# -*- coding: utf-8 -*-
from django.utils.translation import ugettext as _
from django.db import models
from django.contrib.auth.models import User
class MaterialRecord(models.Model):
    class Meta:
        verbose_name = _('material record')
        verbose_name_plural = _('material records')

    choices_asset_type = (
        (1, '耗材'),
        (2, '固定资产'),
    )

    name = models.CharField(_('material name'), max_length=100)
    type = models.TextField(_('material type'))
    unit = models.CharField(_('unit of material'), max_length=20)
    number = models.IntegerField(_('material number'), default=0)
    left_number = models.IntegerField(_('left number'), default=0)
    price = models.FloatField(_('material price'), default=0.0)
    total_cost = models.FloatField(_('total cost'), default=0.0)
    # asset_type = models.IntegerField(_('asset type'), choices=choices_asset_type)

    def __unicode__(self):
        return "%s" % self.name

class ClassRoom(models.Model):
    class Meta:
        verbose_name = _('class room')
        verbose_name_plural = _('class room')

    number = models.CharField(_('class room number'), max_length=30)
    name = models.CharField(_('class room name'), max_length=50)
    admin = models.ForeignKey(User, verbose_name = _('class room admin'))

    def __unicode__(self):
        return "%s" % self.number
