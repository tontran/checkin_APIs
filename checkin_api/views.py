import os

from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404, render, redirect
from django.contrib.auth import get_user_model, authenticate, logout, login
from django.contrib import messages
from rest_framework import generics, permissions, status, viewsets
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAdminUser
from rest_framework.response import Response
from django.core.exceptions import ImproperlyConfigured
from rest_framework.decorators import api_view, permission_classes, authentication_classes, action
from rest_framework.generics import *
from rest_framework.schemas import AutoSchema
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token

from checkin_project.settings import BASE_DIR
from .models import *
from .serializers import *
from .forms import CustomUserCreationForm, CustomUserLogInForm, ReviewSubmitForm
from . import serializers
from .utils import get_and_authenticate_user, create_user_account
import coreapi

User = get_user_model()


# Staff
class StaffViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAdminUser]
    queryset = Staff.objects.all()
    serializer_class = StaffSerializer


# Location
class LocationViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAdminUser]
    queryset = Location.objects.all()
    serializer_class = LocationSerializer


# Service
class ServiceViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAdminUser]
    queryset = Service.objects.all()
    serializer_class = ServiceSerializer


# CustomUser
class CustomUserViewSet(viewsets.ModelViewSet):
    permission_classes = [IsAdminUser]
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer


# Review
class ReviewViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

    def get(self):
        queryset = Review.objects.all()
        serializer = ReviewSerializer(queryset, many=True)
        return Response(serializer.data)


class ReviewList(APIView):
    permission_classes = [IsAdminUser]

    def get(self, request, format=None):
        reviews = Review.objects.all()
        serializer = ReviewSerializer(reviews, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = ReviewSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ReviewDetail(APIView):
    permission_classes = [IsAdminUser]

    def get_object(self, pk):
        try:
            return Review.objects.get(pk=pk)
        except Review.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        review = self.get_object(pk)
        serializer = ReviewSerializer(review)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        review = self.get_object(pk)
        serializer = ReviewSerializer(review, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        review = self.get_object(pk)
        review.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


# Authentication
class AuthViewSet(viewsets.GenericViewSet):
    permission_classes = [AllowAny, ]
    serializer_class = serializers.EmptySerializer
    serializer_classes = {
        'login': serializers.UserLoginSerializer,
        'register': serializers.UserRegisterSerializer,
        'password_change': serializers.PasswordChangeSerializer,
    }

    @action(methods=['POST', ], detail=False)
    def login(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = get_and_authenticate_user(**serializer.validated_data)
        data = serializers.AuthUserSerializer(user).data
        return Response(data=data, status=status.HTTP_200_OK)

    @action(methods=['POST', ], detail=False)
    def register(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = create_user_account(**serializer.validated_data)
        data = serializers.AuthUserSerializer(user).data
        return Response(data=data, status=status.HTTP_201_CREATED)

    @action(methods=['POST', ], detail=False, permission_classes=[IsAuthenticated, ])
    def logout(self, request):
        logout(request)
        data = {'success': 'Sucessfully logged out'}
        return Response(data=data, status=status.HTTP_200_OK)

    @action(methods=['POST'], detail=False, permission_classes=[IsAuthenticated, ])
    def password_change(self, request):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        request.user.set_password(serializer.validated_data['new_password'])
        request.user.save()
        data = {'success': 'Password changed successfully!'}
        return Response(data=data, status=status.HTTP_204_NO_CONTENT)

    def get_serializer_class(self):
        if not isinstance(self.serializer_classes, dict):
            raise ImproperlyConfigured("serializer_classes should be a dict mapping.")
        if self.action in self.serializer_classes.keys():
            return self.serializer_classes[self.action]
        return super().get_serializer_class()


# User Auth
class ObtainAuthTokenView(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request):
        context = {}
        phone = request.POST.get('phone')
        email = request.POST.get('email')
        password = request.POST.get('password')
        account = authenticate(email=email, password=password, phone=phone)
        if account:
            try:
                token = Token.objects.get(user=account)
            except Token.DoesNotExist:
                token = Token.objects.create(user=account)
            context['response'] = 'Successfully authenticated!!!'
            # context['pk'] = account.pk
            # context['first_name'] = account.first_name
            # context['last_name'] = account.last_name
            # context['email'] = email
            # context['phone'] = phone
            # context['date_of_birth'] = account.date_of_birth
            context['token'] = token.key
        else:
            context['response'] = 'Error'
            context['error_message'] = 'Invalid credentials Huhuhu'
            # context['token'] = token.key

        return Response(context)


# # User Logout
# class Logout(APIView):
#     def get(self, request, format=None):
#         # simply delete the token to force a login
#         request.user.auth_token.delete()
#         if token:
#
#         return Response(status=status.HTTP_200_OK)

# User Registration
@api_view(['POST', ])
@permission_classes([])
@authentication_classes([])
def registration_view(request):
    if request.method == 'POST':
        data = {}
        phone = request.data.get('phone', '0')
        if validate_phone(phone) != None:
            data['error_message'] = 'That number is already in use.'
            data['response'] = 'Error'
            return Response(data)

        email = request.data.get('email', '0').lower()
        if validate_email(email) != None:
            data['error_message'] = 'That email is already in use.'
            data['response'] = 'Error'
            return Response(data)

        serializer = RegistrationSerializer(data=request.data)

        if serializer.is_valid():
            account = serializer.save()
            data['response'] = 'successfully registered new user.'
            # data['first_name'] = account.first_name
            # data['last_name'] = account.last_name
            # data['email'] = account.email
            # data['phone'] = account.phone
            # data['date_of_birth'] = account.date_of_birth
            # data['pk'] = account.pk
            # data['token'] = token
        else:
            data = serializer.errors

        return Response(data)


def validate_phone(phone):
    account = None
    try:
        account = CustomUser.objects.get(phone=phone)
    except CustomUser.DoesNotExist:
        return None
    if account != None:
        return phone


def validate_email(email):
    account = None
    try:
        account = CustomUser.objects.get(email=email)
    except CustomUser.DoesNotExist:
        return None
    if account != None:
        return email


# For templates
def homepage(request):
    if request.method == "POST":
        form = ReviewSubmitForm(request.POST)
        # location_id = form.cleaned_data.get('location_id')
        # print("Location: ", location_id)
        if form.is_valid():
            review = form.save()
            print("Review: ", review)
            messages.success(request, f"Thank you for your reviews: {review}")
            return HttpResponseRedirect('/') # this to prevent resubmission
        else:
            for msg in form.error_messages:
                print(form.error_messages[msg])
    form = ReviewSubmitForm
    return render(request,
                  template_name='main/home.html',
                  context={"form": form, "locations": Location.objects.all()})

def reviewpage(request):
    return render(request,
                  template_name='main/reviews.html',
                  context={"reviews": Review.objects.all})
# def submit_review(request):
#     if request.method == "POST":
#         form = ReviewSubmitForm(request.POST)
#         if form.is_valid():
#             messages.success(request, f"Thank you for your reviews")
#         else:
#             for msg in form.error_messages:
#                 print(form.error_messages[msg])
#     form = ReviewSubmitForm
#     return redirect("checkin_api:homepage")


def register(request):
    #if request.method == "POST":
    form = CustomUserCreationForm(request.POST or None)
    if form.is_valid():
        user = form.save()
        email = form.cleaned_data.get('email')
        messages.success(request, f"New account created: {email}")
        login(request, user)
        messages.info(request, f"You're now logged in as {email}")
        return HttpResponseRedirect('/')

    # form = CustomUserCreationForm
    return render(request,
                  "main/register.html",
                  context={"form": form})

def login_request(request):
    if request.method == "POST":
        form = CustomUserLogInForm(data=request.POST)
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            user = authenticate(email=email, password=password)
            if user is not None:
                login(request, user)
                messages.info(request, f"You're now logged in as: {email}")
                return redirect("/")
            else:
                messages.error(request, "Invalid email or password")
        else:
            messages.error(request, "Something is wrong!!!")
    form = CustomUserLogInForm
    return render(request,
                  "main/login.html",
                  context={"form": form})

def logout_request(request):
    logout(request)
    messages.info(request, "Successfully logged out!")
    # return render("checkin_api:homepage")
    return render(request, "main/home.html")