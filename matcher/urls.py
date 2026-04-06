from django.urls import path

from matcher import views

urlpatterns = [
    path("", views.index, name="index")
]