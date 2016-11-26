# -*- coding: utf-8 -*-
from django.contrib import admin
from django.contrib import messages
from .models import AddMaterial, InitMaterial, ApplyMaterial, ApplyBuyMaterial
from django.utils.translation import ugettext as _

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

def get_actions(self, request, user_admin):
    """
    如果是只是实训教师，不能调用删除资料的动作。
    """
    actions = super(user_admin, self).get_actions(request)
    if not request.user.is_superuser:
        del actions['delete_selected']
    return actions

def agree_application(self, request, queryset):
    """
    在耗材使用申请界面，实训教师同意之后会减去相应的数量和修改状态。
    """
    queryset.update(is_agree=True)

    for obj in queryset:
        material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)
        material_info.stocks = material_info.stocks - obj.number
        material_info.save()
agree_application.short_description = _("agree the materil applicant")

def agree_buy_application(self, request, queryset):
    """
    在耗材使用申请界面，领导同意之后会减去相应的数量和修改状态。
    """
    queryset.update(is_agree=True)
agree_buy_application.short_description = _("agree buy the material applicant")

class InitMaterialAdmin(admin.ModelAdmin):
    fields = ['stocks','material', 'class_room']
    readonly_fields = ['stocks']
    list_display = ['material', 'class_room', 'stocks']

    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_init_material')

    def get_actions(self, request):
        return get_actions(self, request, InitMaterialAdmin)

class AddMaterialAdmin(admin.ModelAdmin):
    class Meta:
        model = AddMaterial

    list_display = ['material_info', 'add_number', 'add_time']

    def get_queryset(self, request):
        if request.user.is_superuser:
            return super(AddMaterialAdmin, self).get_queryset(request)
        return super(AddMaterialAdmin, self).get_queryset(request).filter(material_info__class_room__admin=request.user)

    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_add_material')

    def get_actions(self, request):
        return get_actions(self, request, AddMaterialAdmin)


class ApplyMaterialAdmin(admin.ModelAdmin):

    def get_applicant_name(self, obj):
        return format(u'%s' % obj.applicant.first_name)
    get_applicant_name.short_description = _('applicant')

    fields = ['class_room', 'material', 'number']
    list_display = ['class_room', 'material', 'number', 'is_agree', 'apply_time', 'get_applicant_name']
    actions = [agree_application]
    list_per_page = 10

    def save_model(self, request, obj, form, change):

        try:
            material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)
        except Exception:
            material_info = None

        if change and (obj.class_room.admin == request.user):
            material_info.stocks = material_info.stocks - obj.number
            material_info.save()

            obj.is_agree = True
            super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)
        else:
            obj.applicant = request.user
            if material_info is None:
                messages.warning(request, _('there is not the material u chosen in the class room,please call the class room administrator'))
            elif material_info.stocks < obj.number:
                messages.warning(request, _('the material in the class room is not enough. %(number)s %(unit)s only ') % {'number':material_info.stocks, 'unit': material_info.material.unit})
            else:
                super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)

class ApplyBuyMaterialAdmin(admin.ModelAdmin):

    fields = ['class_room', 'material', 'number', 'unit']
    list_display = ['class_room', 'material', 'number', 'unit', 'is_agree', 'apply_time']
    actions = [agree_buy_application]

    def get_list_display_links(self, request, list_display):
        return get_list_display_links(self, request, list_display, 'flow.list_buy_material')

    def get_actions(self, request):
        actions = super(ApplyBuyMaterialAdmin, self).get_actions(request)
        if not request.user.is_superuser:
            del actions['agree_buy_application']
        return actions


    def save_model(self, request, obj, form, change):
        if change and request.user.is_superuser:
            obj.is_agree = True
            super(ApplyBuyMaterialAdmin, self).save_model(request, obj, form, change)
        else:
            obj.applicant = request.user
            super(ApplyBuyMaterialAdmin, self).save_model(request, obj, form, change)

admin.site.register(AddMaterial, AddMaterialAdmin)
admin.site.register(InitMaterial, InitMaterialAdmin)
admin.site.register(ApplyMaterial, ApplyMaterialAdmin)
admin.site.register(ApplyBuyMaterial, ApplyBuyMaterialAdmin)
