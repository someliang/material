# -*- coding: utf-8 -*-
from django.contrib import admin
from .models import MaterialRecord, ClassRoom
from django.utils.translation import ugettext as _

def get_actions(self, request, user_admin):
    """
    如果是只是实训教师，不能调用删除资料的动作。
    """
    actions = super(user_admin, self).get_actions(request)
    if not request.user.is_superuser:
        del actions['delete_selected']
    return actions
class MaterialRecordAdmin(admin.ModelAdmin):
    list_display = ['name', 'type', 'unit', 'number', 'left_number', 'price', 'total_cost', 'asset_type','ps', 'use_instructions']
    fields = ['name', 'type', 'unit', 'number', 'left_number', 'price', 'total_cost', 'asset_type', 'ps', 'use_instructions']

    def get_actions(self, request):
        return get_actions(self, request, MaterialRecordAdmin)


class ClassRoomAdmin(admin.ModelAdmin):

    def get_admin_name(self, obj):
        return format(u'%s' % obj.admin.first_name)
    get_admin_name.short_description = _('class room admin')

    list_display = ['number', 'name', 'get_admin_name']

admin.site.register(MaterialRecord, MaterialRecordAdmin)
admin.site.register(ClassRoom, ClassRoomAdmin)
