# -*- coding: utf-8 -*-
from django.contrib import admin
from .models import MaterialRecord, ClassRoom
from django.utils.translation import ugettext as _

class MaterialRecordAdmin(admin.ModelAdmin):
    list_display = ['name', 'type', 'unit', 'number', 'left_number', 'price', 'total_cost', 'asset_type']
    fields = ['name', 'type', 'unit', 'number', 'left_number', 'price', 'total_cost', 'asset_type']

class ClassRoomAdmin(admin.ModelAdmin):

    def get_admin_name(self, obj):
        return format(u'%s' % obj.admin.first_name)
    get_admin_name.short_description = _('class room admin')

    list_display = ['number', 'get_admin_name']

admin.site.register(MaterialRecord, MaterialRecordAdmin)
admin.site.register(ClassRoom, ClassRoomAdmin)
