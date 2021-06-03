from django.contrib import admin
from .models import *
# Register your models here.


class ClientAdmin(admin.ModelAdmin):

    list_display = ('id', 'account_number', 'firstName', 'lastName', 'town', 'sex', 'born_year')


admin.site.register(Client, ClientAdmin)