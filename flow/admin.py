# -*- coding: utf-8 -*-
from django.contrib import admin
from django.contrib import messages
from .models import AddMaterial, InitMaterial, ApplyMaterial, ApplyBuyMaterial
from django.utils.translation import ugettext as _

class InitMaterialAdmin(admin.ModelAdmin):
    fields = ['stocks','material', 'class_room']
    readonly_fields = ['stocks']

class AddMaterialAdmin(admin.ModelAdmin):
    class Meta:
        model = AddMaterial

    def get_queryset(self, request):
        if request.user.is_superuser:
            return super(AddMaterialAdmin, self).get_queryset(request)
        return super(AddMaterialAdmin, self).get_queryset(request).filter(material_info__class_room__admin=request.user)

    def get_list_display_links(self, request, list_display):
        """
        如果是管理员可以编辑所有的入库资料，如果是实训室教师只能查看。
        """
        if self.list_display_links or self.list_display_links is None or not list_display:
            return self.list_display_links
        else:
            if not request.user.is_superuser and request.user.has_perm('flow.list_add_material'):
                return None
            return list(list_display)

    def get_actions(self, request):
        """
        如果是只是实训教师，不能删除入库资料。
        """
        actions = super(AddMaterialAdmin, self).get_actions(request)
        if not request.user.is_superuser:
            del actions['delete_selected']
        return actions


def agree_application(self, request, queryset):
    queryset.update(is_agree=True)

    for obj in queryset:
        material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)
        material_info.stocks = material_info.stocks - obj.number
        material_info.save()

agree_application.short_description = _("agree the materil applicant")

class ApplyMaterialAdmin(admin.ModelAdmin):

    def get_applicant_name(self, obj):
        return format(u'%s' % obj.applicant.first_name)
    get_applicant_name.short_description = _('applicant')

    fields = ['class_room', 'material', 'number']
    list_display = ['class_room', 'material', 'number', 'is_agree', 'apply_time', 'get_applicant_name']
    actions = [agree_application]
    list_per_page = 10

    def save_model(self, request, obj, form, change):

        material_info = InitMaterial.objects.filter(material=obj.material).get(class_room=obj.class_room)

        if change and (obj.class_room.admin.user == request.user):

            material_info.stocks = material_info.stocks - obj.number
            material_info.save()

            obj.is_agree = True
            super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)

        else:
            obj.applicant = request.user
            super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)

            # validation
            # if material_info.stocks > obj.number:
            #     obj.applicant = request.user
            #     super(ApplyMaterialAdmin, self).save_model(request, obj, form, change)
            # else:
            #     messages.warning(request, _('the material in the class room is not enough.'))





class ApplyBuyMaterialAdmin(admin.ModelAdmin):

    fields = ['class_room', 'material', 'number', 'unit']

    def save_model(self, request, obj, form, change):

        #TODO:这里需要再检验用户是否为管理员权限
        if change and (obj.class_room.admin.user != request.user):
            obj.is_agree = True
            super(ApplyBuyMaterialAdmin, self).save_model(request, obj, form, change)
        else:
            obj.applicant = request.user
            super(ApplyBuyMaterialAdmin, self).save_model(request, obj, form, change)
# class HandleMaterialAdmin(admin.ModelAdmin):
#     class Meta:
#         model = ApplyMaterial


admin.site.register(AddMaterial, AddMaterialAdmin)
admin.site.register(InitMaterial, InitMaterialAdmin)
admin.site.register(ApplyMaterial, ApplyMaterialAdmin)
admin.site.register(ApplyBuyMaterial, ApplyBuyMaterialAdmin)
