from django.shortcuts import render
from .models import Discoteca, Servicio

def index(request):

    discotecas = Discoteca.objects.all()
    servicios = Discoteca.objects.all()
    
    return render(request, 'pages/index.html', {'discotecas': discotecas, 'servicios': servicios})
