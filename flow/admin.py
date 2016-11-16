from django.contrib import admin
from .models import AddMaterial, InitMaterial

class InitMaterialAdmin(admin.ModelAdmin):
    fields = ['stocks','material', 'class_room']
    readonly_fields = ['stocks']

admin.site.register(AddMaterial)
admin.site.register(InitMaterial, InitMaterialAdmin)
