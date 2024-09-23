# sistema_discoteca/urls.py
from django.contrib import admin
from django.urls import path, include
from discotecas.views import index

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', index, name='index'), 
]
