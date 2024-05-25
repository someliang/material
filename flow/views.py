# -*- coding: utf-8 -*-
from django.core import serializers
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from work.models import MaterialRecord

def material_search(request):
    res = MaterialRecord.objects.filter(name__icontains=request.GET['material_name'])
    data = serializers.serialize('json', res)
    return JsonResponse(data, safe=False)

def material_detail(request):
    res = MaterialRecord.objects.get(id = int(request.GET['id']))
    data = serializers.serialize('json', [res])
    return JsonResponse(data, safe=False)
