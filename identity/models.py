import datetime

from django.db import models
from django.contrib.auth.models import User

# Create your models here.

# class User(models.Model):
#     name = models.CharField(max_length=100)
#     email = models.EmailField(max_length=100, unique=True)
#     message = models.CharField


class Client(models.Model):
    """
      Client model class, use to retrieve all clients
      informations of the user Here we're just defining
      fields we we'll use in the program.
    """
    id = models.AutoField(primary_key=True)
    account_number = models.CharField('account_number', max_length=11, unique=True, null=False)
    firstName = models.CharField('firstName', max_length=200, null=False)
    lastName = models.CharField('lastName', max_length=200, null=False)
    town = models.CharField('town', max_length=50, null=False)
    sex = models.CharField('sex', max_length=1, null=False)
    born_year = models.DateField('born_year', default=datetime.date.today)
    created_at = models.DateTimeField(auto_now_add=True)