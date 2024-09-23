# discotecas/admin.py

from django.contrib import admin
from .models import Discoteca, Servicio, Calificacion

admin.site.register(Discoteca)
admin.site.register(Servicio)
admin.site.register(Calificacion)
