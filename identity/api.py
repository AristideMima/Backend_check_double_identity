from .models import *
from rest_framework import viewsets, permissions, status
from .serializers import ClientSerializer
from rest_framework.decorators import action
from rest_framework.response import Response
from django.http import JsonResponse
from .model_utils import get_image_from_file
from django.core import serializers
from rest_framework import status


# Client ViewSet
class ClientView(viewsets.ModelViewSet):

    queryset = Client.objects.all()
    permission_classes = [
        permissions.IsAuthenticated
    ]
    serializer_class = ClientSerializer

    # def list(self, request):
    #
    #     get_image_from_file("00010951002")
    #
    #     a = {"res": "yes"}
    #     return Response(a)

    # def get_queryset(self):
    #
    #     print(self.request.user)
    #
    #     pass

    # def retrieve(self, request, pk=None):
    #
    #     # predictions = get_image_from_file(pk)
    #
    #     print(self.queryset)
    #
    #     response = {}
    #
    #     # if predictions is not None:
    #     #
    #     #     response = [{"account_number": tup[1], "probability": tup[0]} for index, tup in enumerate(predictions)]
    #
    #     return Response(response)
    # @action(detail=False, methods=['GET'], url_path='check_mat/<str:accoun_number')

    # def get_queryset(self):
    #
    #     print(self.request.query_params['account_number'])
    #
    #     return self.queryset

    def check_account(self, request, *args, **kwargs):

        check_number = request.query_params.get('account_number')

        if check_number is not None:

            data_one = self.queryset.filter(account_number=check_number).values()

            # Check if the account effectively exist
            if len(list(data_one)) is not 0:

                # Get prediction results if it exists
                predictions = get_image_from_file(check_number)

                if predictions is not None:

                    response = {tup[1]: tup[0] for tup in predictions}

                    # Get all accounts values
                    accounts_number = [tup[1] for tup in predictions]

                    print(accounts_number)

                    # Get all accounts
                    data = list(self.queryset.filter(account_number__in=accounts_number).values())

                    # Add probability field and value
                    for doc in data:
                        accounts_number_val = doc['account_number']

                        doc['probability'] = response[accounts_number_val]

                    print(data)

                    return Response(data)

                return Response({"message": "Bad photo quality inside the corresponding folder"},
                                status=status.HTTP_500_INTERNAL_SERVER_ERROR)
            return Response({"message": "This account doesn't exist"},
                            status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response({"message": "You most provide an account number"},
                        status=status.HTTP_500_INTERNAL_SERVER_ERROR)
