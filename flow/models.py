# -*- coding: utf-8 -*-
from django.db import models
from django.utils.translation import ugettext as _
from work.models import MaterialRecord, ClassRoom
import django.utils.timezone as timezone
from django.contrib.auth.models import User
#
#
# class InitMaterial(models.Model):
#
#     class Meta:
#         verbose_name = _('init material')
#         verbose_name_plural = _('init material')
#
#     stocks = models.IntegerField(_('stock material number'), default = 0)
#     material = models.ForeignKey(Material, verbose_name = _('material name'))
#     class_room = models.ForeignKey(ClassRoom, verbose_name = _('class room number'))
#
#     def __unicode__(self):
#         return u"%s-%s" % (self.class_room, self.material)
#

class ApplyBuyMaterialProcess(models.Model):

    class Meta:
        verbose_name=_('apply buy material process')
        verbose_name_plural = _('apply buy material process')

    material_record = models.OneToOneField(MaterialRecord, related_name='material_process', on_delete=models.CASCADE,verbose_name=_('material name'))
    class_room = models.ForeignKey(ClassRoom, verbose_name = _('apply material class room number'))
    is_agree = models.BooleanField(_('apply status'), default=False)
    is_storage = models.BooleanField(_('storage status'), default=False)
    applicant = models.ForeignKey(User, verbose_name= _('applicant'))
    apply_time = models.DateTimeField(_('apply time'), auto_now_add=True)
    storage_time = models.DateTimeField(_('storage time'), blank=True, null=True)
    def __unicode__(self):
        return u"%s-%s-%s" % (self.material_record, self.class_room, self.applicant.first_name)

class ApplyMaterial(models.Model):

    class Meta:
        verbose_name=_('apply material for teacher')
        verbose_name_plural = _('apply material for teacher')

    number = models.IntegerField(_('apply use number'),default=0)
    buy_material_process = models.ForeignKey(ApplyBuyMaterialProcess, verbose_name=_('buy material process'),blank=True, null=True) #备用流程选择，老师可以从自己申请的耗材流程中直接选择
    material_record = models.ForeignKey(MaterialRecord,verbose_name=_('material name'), blank=True, null=True)
    is_agree = models.BooleanField(_('apply status'), default=False)
    agree_time = models.DateTimeField(_('apply time'), blank=True, null=True)
    applicant = models.ForeignKey(User, verbose_name= _('applicant'))
    apply_time = models.DateTimeField(_('apply time'), auto_now_add=True)

    def __unicode__(self):
        if self.buy_material_process:
            return u"%s" % self.buy_material_process
        else:
            return u"%s" % self.material_record

class AddMaterial(models.Model):

    class Meta:
        verbose_name = _('add material')
        verbose_name_plural = _('add material')

    material_record = models.ForeignKey(MaterialRecord, related_name='add_material', verbose_name=_('material name'))
    class_room = models.ForeignKey(ClassRoom, verbose_name = _('add material room number'))
    add_time = models.DateTimeField(_('add time'), auto_now_add=True)

    def __unicode__(self):
        return u"%s-%s-%s%s" % (self.class_room,self.material_record, self.material_record.number, self.material_record.unit)





