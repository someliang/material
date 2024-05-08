# -*- coding: utf-8 -*-
from django.contrib import admin
from django.core.mail.backends import console

from .models import AddMaterial, ApplyBuyMaterialProcess #InitMaterial, ApplyMaterial, ApplyBuyMaterial
from django.db.models import Q
from django.utils.translation import ugettext as _
import django.utils.timezone as timezone
from django import forms
#
def get_list_display_links(self, request, list_display, perm):
    """
    如果是管理员可以编辑所有的资料，如果是实训室教师只能查看。
    """
    if self.list_display_links or self.list_display_links is None or not list_display:
        return self.list_display_links
    else:
        if not request.user.is_superuser and request.user.has_perm(perm):
            return None
        return list(list_display)[:1]
#
# def get_actions(self, request, user_admin):
#     """
#     如果是只是实训教师，不能调用删除资料的动作。
#     """
#     actions = super(user_admin, self).get_actions(request)
#     if not request.user.is_superuser:
#         del actions['delete_selected']
#     return actions
#
def get_actions_del_agree(self, request, user_admin, perm, custom_actions):
    """
    某一权限的用户需要删除某一权限.
    :param self: Admin实例
    :param request: 请求
    :param user_admin: Admin类
    :param perm: 权限
    :param action: 需要删除的某一列表action
    :return: 删除后的action
    """
    actions = super(user_admin, self).get_actions(request)
    if not request.user.is_superuser:
        for action in custom_actions:
            del actions[action]
    return actions

# def get_action_storage(self, request, user_admin, perm, action):


#
# def agree_application(self, request, queryset):
#     """
#     在耗材使用申请界面，实训教师同意之后会减去相应的数量和修改状态。
#     """
#     queryset.update(is_agree=True)
#
#     for obj in queryset:
#         material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)
#         material_info.stocks = material_info.stocks - obj.number
#         material_info.save()
# agree_application.short_description = _("agree the materil applicant")
#
def agree_buy_application(self, request, queryset):
    """
    在耗材使用申请界面，管理员同意之后会和修改状态。
    """
    queryset.update(is_agree=True)
agree_buy_application.short_description = _("agree buy the material applicant")

def storage_application(self, request, queryset):
    """
    下拉列表中的入库动作
    """
    queryset.update(is_storage=True)
    queryset.update(storage_time=timezone.now())
storage_application.short_description = _("storage application")

def get_queryset(self,request, user_admin, perm):
    """
    在耗材使用申请界面和购买申请界面使用,会根据权限返回相应的结果集.
    :param self: Admin类实例
    :param request: 请求
    :param user_admin: Admin类
    :param perm: 权限
    :return: 返回相应权限的查询结果
    """
    if request.user.is_superuser:
        return super(user_admin, self).get_queryset(request)
    elif request.user.groups.filter(id=2).exists():
        return super(user_admin, self).get_queryset(request).filter(applicant=request.user)
    else:
        return super(user_admin, self).get_queryset(request).filter(Q(class_room__admin=request.user) | Q(applicant=request.user))
#
# class InitMaterialAdmin(admin.ModelAdmin):
#
#     def get_material_unit(self, obj):
#         return format(u'%s' % obj.material.unit)
#
#     get_material_unit.short_description = _('material unit')
#
#     fields = ['stocks','material', 'class_room']
#     readonly_fields = ['stocks']
#     list_display = ['material', 'class_room', 'stocks','get_material_unit']
#
#     def get_list_display_links(self, request, list_display):
#         return get_list_display_links(self, request, list_display, 'flow.list_init_material')
#
#     def get_actions(self, request):
#         return get_actions(self, request, InitMaterialAdmin)
#
class AddMaterialAdmin(admin.ModelAdmin):
    class Meta:
        model = AddMaterial

    def get_material_record_type(self, obj):
        return format(u'%s' % obj.material_record.type)
    get_material_record_type.short_description = _('material type')

    def get_material_record_unit(self, obj):
        return format(u'%s' % obj.material_record.unit)
    get_material_record_unit.short_description = _('material unit')

    def get_material_record_price(self, obj):
        return format(u'%s' % obj.material_record.price)
    get_material_record_price.short_description = _('material price')

    def get_material_record_number(self, obj):
        return format(u'%s' % obj.material_record.number)
    get_material_record_number.short_description = _('material number')

    def get_material_record_total_cost(self, obj):
        return format(u'%s' % obj.material_record.total_cost)
    get_material_record_total_cost.short_description = _('material total')

    list_display = ['material_record', 'get_material_record_type', 'get_material_record_unit', 'get_material_record_number',
                    'get_material_record_price', 'get_material_record_total_cost', 'class_room' ]
#
    def get_queryset(self, request):
        if request.user.is_superuser:
            return super(AddMaterialAdmin, self).get_queryset(request)
        return super(AddMaterialAdmin, self).get_queryset(request).filter(class_room__admin=request.user)
#
#     def get_list_display_links(self, request, list_display):
#         return get_list_display_links(self, request, list_display, 'flow.list_add_material')
#
#     def get_actions(self, request):
#         return get_actions(self, request, AddMaterialAdmin)
#
#     def save_model(self, request, obj, form, change):
#         """
#          自定义的保存方法，如果入库时，没有此种耗材的库存则初始化耗材库存，有则添加库存耗材数量。
#         """
#         try:
#             material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)
#         except Exception:
#             material_info = None
#
#         if not change and material_info is not None:
#             material_info.stocks = material_info.stocks + obj.add_number
#             material_info.save()
#         else:
#             material_info = InitMaterial()
#             material_info.stocks = obj.add_number
#             material_info.material = obj.material
#             material_info.class_room = obj.class_room
#             material_info.save()
#
#         super(AddMaterialAdmin, self).save_model(request, obj, form, change)
#
#
# class CustomApplyMaterialFrom(forms.ModelForm):
#     """
#     自定义的耗材申请表单验证类，如果发现申请的数量大于库存或者该教室内没有要求的耗材表单都会报错。
#     """
#     class Meta:
#         model = ApplyMaterial
#         fields = ['class_room', 'material', 'number']
#
#     def clean(self):
#         material = self.cleaned_data['material']
#         class_room = self.cleaned_data['class_room']
#         number = self.cleaned_data['number']
#
#         try:
#             material_info = InitMaterial.objects.filter(material=material).get(class_room=class_room)
#         except Exception:
#             info = _('there is not the material u chosen in the class room,please call the class room administrator:%(admin)s.') % {'admin':class_room.admin.first_name}
#             raise forms.ValidationError(info)
#
#         if material_info.stocks < number:
#             info = _('the material in the class room is not enough. %(number)s %(unit)s only. ') % {'number':material_info.stocks, 'unit': material.unit}
#             raise forms.ValidationError(info)
#
#
#
# class ApplyMaterialAdmin(admin.ModelAdmin):
#
#     def get_applicant_name(self, obj):
#         return format(u'%s' % obj.applicant.first_name)
#     get_applicant_name.short_description = _('applicant')
#
#     form = CustomApplyMaterialFrom
#     list_display = ['class_room', 'material', 'number', 'is_agree', 'apply_time', 'get_applicant_name']
#     actions = [agree_application]
#     list_per_page = 10
#
#     def get_list_display_links(self, request, list_display):
#         return get_list_display_links(self, request, list_display, 'flow.list_apply_material')
#
#     def get_queryset(self, request):
#         return get_queryset(self, request, ApplyMaterialAdmin, "flow.list_apply_material")
#
#     def get_actions(self, request):
#         return get_actions_del_agree(self, request, ApplyMaterialAdmin, 'flow.list_apply_material', 'agree_application')
#
#
#     def save_model(self, request, obj, form, change):
#         """
#          自定义的保存方法，自动保存申请者，当申请通过时，自动减少库存。
#         """
#         material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)
#
#         if change and (obj.class_room.admin == request.user):
#             material_info.stocks = material_info.stocks - obj.number
#             material_info.save()
#
#             obj.is_agree = True
#             super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)
#         else:
#             obj.applicant = request.user
#             super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)
#
class ApplyBuyMaterialProcessAdmin(admin.ModelAdmin):

    def get_material_record_type(self, obj):
        return format(u'%s' % obj.material_record.type)
    get_material_record_type.short_description = _('material type')

    def get_material_record_unit(self, obj):
        return format(u'%s' % obj.material_record.unit)
    get_material_record_unit.short_description = _('material unit')

    def get_material_record_price(self, obj):
        return format(u'%s' % obj.material_record.price)
    get_material_record_price.short_description = _('material price')

    def get_material_record_number(self, obj):
        return format(u'%s' % obj.material_record.number)
    get_material_record_number.short_description = _('material number')

    def get_material_record_total_cost(self, obj):
        return format(u'%s' % obj.material_record.total_cost)
    get_material_record_total_cost.short_description = _('material total')

    def get_applicant_name(self, obj):
        return format(u'%s' % obj.applicant.first_name)
    get_applicant_name.short_description = _('applicant')

    fields = ['class_room', 'material_record']
    list_display = ['material_record', 'get_material_record_type', 'get_material_record_unit', 'get_material_record_number',
                    'get_material_record_price', 'get_material_record_total_cost', 'class_room', 'is_agree', 'apply_time',
                    'get_applicant_name', 'is_storage' ]

    actions = [agree_buy_application, storage_application]
    change_list_template = 'admin/change_list_print.html'
#
    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_buy_material')
#
    def get_queryset(self, request):
        return get_queryset(self, request, ApplyBuyMaterialProcessAdmin, "flow.list_buy_material")
#
    def get_actions(self, request):
        return get_actions_del_agree(self, request, ApplyBuyMaterialProcessAdmin, 'flow.list_buy_material', ['agree_buy_application','storage_application'])

    def save_model(self, request, obj, form, change):
        if change and request.user.is_superuser:
            obj.is_agree = True
            super(ApplyBuyMaterialProcessAdmin, self).save_model(request, obj, form, change)
        else:
            obj.applicant = request.user
            obj.material_record.total = obj.material_record.price * obj.material_record.number
            super(ApplyBuyMaterialProcessAdmin, self).save_model(request, obj, form, change)

admin.site.register(AddMaterial, AddMaterialAdmin)
# admin.site.register(InitMaterial, InitMaterialAdmin)
# admin.site.register(ApplyMaterial, ApplyMaterialAdmin)
admin.site.register(ApplyBuyMaterialProcess, ApplyBuyMaterialProcessAdmin)
