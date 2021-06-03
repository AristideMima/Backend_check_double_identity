from rest_framework import serializers, fields
from .models import *


# Client Serializer
class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Client
        fields = '__all__'
