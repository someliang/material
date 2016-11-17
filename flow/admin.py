from django.contrib import admin
from .models import AddMaterial, InitMaterial, ApplyMaterial

class InitMaterialAdmin(admin.ModelAdmin):
    fields = ['stocks','material', 'class_room']
    readonly_fields = ['stocks']

class AddMaterialAdmin(admin.ModelAdmin):
    class Meta:
        model = AddMaterial
def get_queryset(self, request):
        return super(AddMaterialAdmin, self).get_queryset(request).filter(material_info__class_room__admin__user=request.user)

class ApplyMaterialAdmin(admin.ModelAdmin):
    class Meta:
        model = ApplyMaterial

# class HandleMaterialAdmin(admin.ModelAdmin):
#     class Meta:
#         model = ApplyMaterial


admin.site.register(AddMaterial, AddMaterialAdmin)
admin.site.register(InitMaterial, InitMaterialAdmin)
admin.site.register(ApplyMaterial, ApplyMaterialAdmin)
# admin.site.register(ApplyMaterial, HandleMaterialAdmin)
