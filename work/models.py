# -*- coding: utf-8 -*-
from django.utils.translation import ugettext as _
from django.db import models
from django.contrib.auth.models import User

class Material(models.Model):
    class Meta:
        verbose_name = _('material')
        verbose_name_plural = _('material')

    name = models.CharField(_("material name"), max_length=30)
    standard = models.CharField(_("material standard"), max_length=30,default=None)
    unit = models.CharField(_("material unit"), max_length=30)
    price = models.DecimalField(_("material price"), default=1.0, max_digits=20, decimal_places=2)

    def __unicode__(self):
        return "%s" % self.name


class ClassRoom(models.Model):
    class Meta:
        verbose_name = _('class room')
        verbose_name_plural = _('class room')

    number = models.CharField(_('class room number'), max_length=30)
    admin = models.ForeignKey(User, verbose_name = _('class room admin'))

    def __unicode__(self):
        return "%s" % self.number
