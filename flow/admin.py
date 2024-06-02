# -*- coding: utf-8 -*-
from django.contrib import admin
from django.core.exceptions import FieldError

from work.models import MaterialRecord
from .models import AddMaterial, ApplyBuyMaterialProcess, ApplyMaterial
from django.db.models import Q
from django.utils.translation import ugettext as _
import django.utils.timezone as timezone
from django import forms
from django.contrib.admin import widgets
#
def get_list_display_links(self, request, list_display, perm):
    """
    如果是管理员可以编辑所有的资料，如果是实训室教师只能查看。
    在新版本的设计中，不通过chang from改动，都只能显示，以删除改动。
    先上第一版本，后续再仔细修改。
    """
    # if self.list_display_links or self.list_display_links is None or not list_display:
    #     return self.list_display_links
    # else:
    #     if not request.user.is_superuser and request.user.has_perm(perm):
    #         return None
    #     return list(list_display)[:1]
    return None
def get_actions(self, request, user_admin):
    """
    如果是只是实训教师，不能调用删除资料的动作。
    """
    actions = super(user_admin, self).get_actions(request)
    if request.user.groups.filter(id=2).exists():
        del actions['delete_selected']
    return actions

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
    # if not request.user.is_superuser:
    #     for action in custom_actions:
    #         del actions[action]
    return actions

def agree_application(self, request, queryset):
    """
    在耗材使用申请界面，实训教师同意之后会减去相应的数量和修改状态。
    """

    for obj in queryset:
        material_record = obj.material_record
        if material_record.left_number < obj.number:
            return self.message_user(request, _("left number not enough, please tell applicant"), level='error')
        else:
            obj.is_agree = True
            obj.agree_time = timezone.now()
            material_record.left_number = material_record.left_number - obj.number
            material_record.save()
            obj.save()

agree_application.short_description = _("agree the material applicant")

#
def agree_buy_application(self, request, queryset):
    """
    在耗材使用申请界面，管理员同意之后会和修改状态。
    """
    queryset.update(is_agree = True)
    queryset.update(agree_time = timezone.now())
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
    elif request.user.groups.filter(id=1).exists():
        return super(user_admin, self).get_queryset(request).filter(applicant=request.user)
    else:
        try:
            result = super(user_admin, self).get_queryset(request).filter(Q(class_room__admin=request.user) | Q(applicant=request.user))
        except FieldError :
            result = super(user_admin, self).get_queryset(request).filter(Q(buy_material_process__class_room__admin=request.user) | Q(applicant=request.user))

        return result

class AddMaterialForm(forms.ModelForm):

    name = forms.CharField(label= _('material name'))
    type = forms.CharField(label = _('material type'), widget=forms.Textarea)
    number = forms.IntegerField(label=_('material number'))
    price = forms.FloatField(label=_('material price'))
    unit = forms.CharField(label=_('unit of material'))
    ps = forms.CharField(label=_('material ps'), widget=forms.Textarea)
    use_instructions = forms.CharField(label=_('use instructions'), widget=forms.Textarea)

    class Meta:
        model = AddMaterial
        fields = ['class_room',]



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

    form = AddMaterialForm
#
    def get_queryset(self, request):
        if request.user.is_superuser:
            return super(AddMaterialAdmin, self).get_queryset(request)
        return super(AddMaterialAdmin, self).get_queryset(request).filter(class_room__admin=request.user)

    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_add_material')

    def get_actions(self, request):
        return get_actions(self, request, AddMaterialAdmin)

    def save_model(self, request, obj, form, change):
        material_record = MaterialRecord()
        material_record.asset_type = 1

        material_record.name = form.cleaned_data['name']
        material_record.type = form.cleaned_data['type']
        material_record.number = form.cleaned_data['number']
        material_record.price = form.cleaned_data['price']
        material_record.unit = form.cleaned_data['unit']
        material_record.ps = form.cleaned_data['ps']
        material_record.use_instructions = form.cleaned_data['use_instructions']
        material_record.left_number = material_record.number

        material_record.total_cost = material_record.price * material_record.number
        material_record.save()

        obj.material_record = material_record
        super(AddMaterialAdmin, self).save_model(request, obj, form, change)


#
class CustomApplyMaterialFrom(forms.ModelForm):
    """
    自定义的耗材申请表单验证类，如果发现申请的数量大于库存或者该教室内没有要求的耗材表单都会报错。
    """
    class Meta:
        model = ApplyMaterial
        fields = ['material_record', 'number']

    def __init__(self, *args, **kwargs):
        super(CustomApplyMaterialFrom, self).__init__(*args, **kwargs)
        self.fields['material_record'].label_from_instance = lambda obj: u"耗材名称:%s 剩余数量:%s%s" % (obj.name, obj.left_number, obj.unit)

    def clean(self):
        material_record = self.cleaned_data['material_record']
        number = self.cleaned_data['number']

        #TODO:
        # 1.耗材领用列表的显示界面，考虑inline显示
        # 2.领用的流程要具体显示出来

        if material_record.left_number < number:
            info = (_('the material in the class room is not enough. %(number)s %(unit)s only. ') %
                    {'number': material_record.left_number,
                     'unit': material_record.unit})
            raise forms.ValidationError(info)


class ApplyMaterialAdmin(admin.ModelAdmin):


    def get_applicant_name(self, obj):
        return format(u'%s' % obj.applicant.first_name)
    get_applicant_name.short_description = _('applicant')

    def get_material_name(self, obj):
        return format(u'%s' % obj)
    get_material_name.short_description = _('material name')
#
    form = CustomApplyMaterialFrom
    list_display = ['get_material_name', 'number', 'is_agree', 'apply_time', 'get_applicant_name']
    #TODO:
    #修改一下这里耗材的显示，这里没有流程就没有显示出名字。

    actions = [agree_application]
    list_per_page = 20

    add_form_template = 'admin/ajax_change_form.html'

    def formfield_for_foreignkey(self, db_field, request,  **kwargs):
        if db_field.name == "material_record":
            result1 = MaterialRecord.objects.raw('select * from work_materialrecord join flow_addmaterial on work_materialrecord.id = flow_addmaterial.material_record_id and work_materialrecord.left_number > 0 and work_materialrecord.asset_type = 1')
            result2 = MaterialRecord.objects.raw('select * from work_materialrecord join flow_applybuymaterialprocess on work_materialrecord.id = flow_applybuymaterialprocess.material_record_id where flow_applybuymaterialprocess.is_storage = TRUE and work_materialrecord.left_number > 0 and work_materialrecord.asset_type = 1')

            result = [result1, result2]

            kwargs["queryset"] = result1
        return super(ApplyMaterialAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)
#
    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_apply_material')

    def get_queryset(self, request):
        return get_queryset(self, request, ApplyMaterialAdmin, "flow.list_apply_material")

    def get_actions(self, request):
        actions = super(ApplyMaterialAdmin, self).get_actions(request)
        if request.user.groups.filter(id=1).exists():
            del actions['agree_application']
            del actions['delete_selected']
        return actions

    def save_model(self, request, obj, form, change):
        obj.applicant = request.user
        super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)

class MaterialProcessForm(forms.ModelForm):

    name = forms.CharField(label= _('material name'))
    type = forms.CharField(label = _('material type'), widget=forms.Textarea)
    number = forms.IntegerField(label=_('material number'))
    price = forms.FloatField(label=_('material price'))
    unit = forms.CharField(label=_('unit of material'))
    ps = forms.CharField(label=_('material ps'), widget=forms.Textarea)
    use_instructions = forms.CharField(label=_('use instructions'), widget=forms.Textarea)

    class Meta:
        model = ApplyBuyMaterialProcess
        fields = ['class_room',]


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

    def get_material_record_ps(self, obj):
        return format(u'%s' % obj.material_record.ps)
    get_material_record_ps.short_description = _('material ps')

    def get_use_instructions(self, obj):
        return format(u'%s' % obj.material_record.use_instructions)
    get_use_instructions.short_description = _('use instructions')

    form = MaterialProcessForm
    list_display = ['material_record', 'get_material_record_type', 'get_material_record_unit', 'get_material_record_number',
                    'get_material_record_price', 'get_material_record_total_cost', 'class_room', 'get_material_record_ps',
                    'get_use_instructions', 'is_agree', 'apply_time', 'get_applicant_name', 'is_storage' ]

    actions = [agree_buy_application, storage_application]
    change_list_template = 'admin/change_list_print.html'
    list_per_page = 20
#
    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_buy_material')
#
    def get_queryset(self, request):
        return get_queryset(self, request, ApplyBuyMaterialProcessAdmin, "flow.list_buy_material")
#
    def get_actions(self, request):
        actions = super(ApplyBuyMaterialProcessAdmin, self).get_actions(request)
        if not request.user.is_superuser:
            del actions['agree_buy_application']
            del actions['storage_application']
            del actions['delete_selected']
        return actions

    def save_model(self, request, obj, form, change):
        if change and request.user.is_superuser:
            obj.is_agree = True
            super(ApplyBuyMaterialProcessAdmin, self).save_model(request, obj, form, change)
        else:
            obj.applicant = request.user
            material_record = MaterialRecord()
            material_record.asset_type = 1

            material_record.name = form.cleaned_data['name']
            material_record.type = form.cleaned_data['type']
            material_record.number = form.cleaned_data['number']
            material_record.price = form.cleaned_data['price']
            material_record.unit = form.cleaned_data['unit']
            material_record.ps = form.cleaned_data['ps']
            material_record.use_instructions = form.cleaned_data['use_instructions']
            material_record.left_number =  material_record.number

            material_record.total_cost =  material_record.price * material_record.number
            material_record.save()

            obj.material_record = material_record
            super(ApplyBuyMaterialProcessAdmin, self).save_model(request, obj, form, change)

admin.site.register(AddMaterial, AddMaterialAdmin)
admin.site.register(ApplyMaterial, ApplyMaterialAdmin)
admin.site.register(ApplyBuyMaterialProcess, ApplyBuyMaterialProcessAdmin)
