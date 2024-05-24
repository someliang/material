# -*- coding: utf-8 -*-
from django.core import serializers
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from work.models import MaterialRecord

def material_search(request):
    data = MaterialRecord.objects.filter(name__icontains=request.GET['material_name'])
    res = serializers.serialize('json', data)
    return JsonResponse(res, safe=False)