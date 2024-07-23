from django.urls import path

from conf import views

urlpatterns = [
    path('', views.home),
]
