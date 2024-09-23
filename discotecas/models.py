# discotecas/models.py

from django.db import models

class Discoteca(models.Model):
    nombre = models.CharField(max_length=255)
    ubicacion = models.CharField(max_length=255)

    def __str__(self):
        return self.nombre


class Servicio(models.Model):
    nombre = models.CharField(max_length=255)

    def __str__(self):
        return self.nombre


class Calificacion(models.Model):
    discoteca = models.ForeignKey(Discoteca, on_delete=models.CASCADE)
    servicio = models.ForeignKey(Servicio, on_delete=models.CASCADE)
    puntuacion = models.IntegerField()
    comentario = models.TextField(blank=True, null=True)

    def __str__(self):
        return f'{self.puntuacion} - {self.discoteca.nombre} - {self.servicio.nombre}'

    class Meta:
        constraints = [
            models.CheckConstraint(check=models.Q(puntuacion__gte=1) & models.Q(puntuacion__lte=5), name='puntuacion_range')
        ]
