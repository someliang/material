# -*- coding: utf-8 -*-
from django.contrib import admin
from .models import Material, ClassRoom
from django.utils.translation import ugettext as _

class MaterialAdmin(admin.ModelAdmin):
    list_display = ['name', 'unit', 'price', 'standard']

class ClassRoomAdmin(admin.ModelAdmin):

    def get_admin_name(self, obj):
        return format(u'%s' % obj.admin.first_name)
    get_admin_name.short_description = _('class room admin')

    list_display = ['number', 'get_admin_name']

admin.site.register(Material, MaterialAdmin)
admin.site.register(ClassRoom, ClassRoomAdmin)
