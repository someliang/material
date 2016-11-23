from django.contrib import admin
from django.contrib import messages
from .models import AddMaterial, InitMaterial, ApplyMaterial
from django.utils.translation import ugettext as _

class InitMaterialAdmin(admin.ModelAdmin):
    fields = ['stocks','material', 'class_room']
    readonly_fields = ['stocks']

class AddMaterialAdmin(admin.ModelAdmin):
    class Meta:
        model = AddMaterial

    def get_queryset(self, request):
        return super(AddMaterialAdmin, self).get_queryset(request).filter(material_info__class_room__admin__user=request.user)

class ApplyMaterialAdmin(admin.ModelAdmin):

    fields = [ 'class_room', 'material', 'number']

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



# class HandleMaterialAdmin(admin.ModelAdmin):
#     class Meta:
#         model = ApplyMaterial


admin.site.register(AddMaterial, AddMaterialAdmin)
admin.site.register(InitMaterial, InitMaterialAdmin)
admin.site.register(ApplyMaterial, ApplyMaterialAdmin)
# admin.site.register(ApplyMaterial, HandleMaterialAdmin)
