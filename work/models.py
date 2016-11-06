# -*- coding: utf-8 -*-
from django.utils.translation import ugettext as _
from django.db import models


class Material(models.Model):
    class Meta:
        verbose_name = _('material')
        verbose_name_plural = _('material')

    name = models.CharField(_("material name"), max_length=30)
    unit = models.CharField(_("material unit"), max_length=30)
