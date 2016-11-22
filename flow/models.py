# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext as _
from work.models import Material, ClassRoom
import django.utils.timezone as timezone
from django.contrib.auth.models import User


class InitMaterial(models.Model):

    class Meta:
        verbose_name = _('init material')
        verbose_name_plural = _('init material')

    stocks = models.IntegerField(_('stock material number'), default = 0)
    material = models.ForeignKey(Material, verbose_name = _('material name'))
    class_room = models.ForeignKey(ClassRoom, verbose_name = _('class room number'))

    def __unicode__(self):
        return u"%s-%s" % (self.class_room, self.material)

class ApplyMaterial(models.Model):

    class Meta:
        verbose_name=_('apply material for teacher')
        verbose_name_plural = _('apply material for teacher')

    number = models.IntegerField(_('apply use number'),default=0)
    material = models.ForeignKey(Material,verbose_name=_('material name'))
    class_room = models.ForeignKey(ClassRoom, verbose_name = _('apply material class room number'))
    is_agree = models.BooleanField(_('apply status'), default=False)
    applicant = models.ForeignKey(User, verbose_name= _('applicant'))
    apply_time = models.DateTimeField(_('apply time'), auto_now_add=True)

    def __unicode__(self):
        return u"%s-%s-%s" % (self.material, self.class_room, self.applicant)

class AddMaterial(models.Model):

    class Meta:
        verbose_name = _('add material')
        verbose_name_plural = _('add material')

    add_number = models.IntegerField(_('add material number'), default = 0)
    material_info = models.ForeignKey(InitMaterial, verbose_name=_('material info'))
    add_time = models.DateTimeField(_('add time'), default=timezone.now())

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        self.material_info.stocks = self.material_info.stocks + self.add_number
        self.material_info.save()
        super(AddMaterial,self).save(force_insert,force_update,using,update_fields)

    def __unicode__(self):
        return u"%s-%s%s" % (self.material_info, self.add_number, self.material_info.material.unit)





