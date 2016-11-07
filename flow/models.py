# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext as _
from work.models import Material, ClassRoom

class AddMaterial(models.Model):
    class Meta:
        verbose_name = _('add material')
        verbose_name_plural = _('add material')

    now_number = models.IntegerField(_('resume material number'), default = 0)
    add_number = models.IntegerField(_('add material number'), default = 0)
    material = models.ForeignKey(Material,verbose_name=_('material name'))
    class_room = models.ForeignKey(ClassRoom ,verbose_name=_('class room number'))






