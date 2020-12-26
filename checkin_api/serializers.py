from django.contrib.auth import get_user_model, password_validation
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import BaseUserManager
from rest_framework import serializers
from django.apps import apps
from rest_auth.serializers import TokenSerializer, LoginSerializer as RestAuthLoginSerializer
# models = apps.get_models()
from phone_field import *
from .models import *
User = get_user_model()

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = "__all__"

class CustomTokenSerializer(TokenSerializer):
    user = UserSerializer(read_only=True)
    class Meta(TokenSerializer.Meta):
        fields = ['key', 'user']

class UserLoginSerializer(serializers.Serializer):
    email = serializers.CharField(max_length=300, required=True)
    password = serializers.CharField(required=True, write_only=True)

class UserRegisterSerializer(serializers.ModelSerializer):
    """
    A user serializer for registering the user
    """
    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'first_name', 'last_name', 'date_of_birth', 'phone')

    def validate_email(self, value):
        user = User.objects.filter(email=value)
        if user:
            raise serializers.ValidationError("Email is already taken")
        return BaseUserManager.normalize_email(value)

    def validate_password(self, value):
        password_validation.validate_password(value)
        return value

class AuthUserSerializer(serializers.ModelSerializer):
    auth_token = serializers.SerializerMethodField()
    class Meta:
        model = get_user_model()
        fields = ('id', 'email', 'first_name', 'last_name', 'phone', 'is_active', 'is_staff', 'auth_token')
        read_only_fields = ('id', 'is_active', 'is_staff')

    def get_auth_token(self, obj):
        if obj:
            try:
                token = Token.objects.get(user=obj)  # if Token exists, get Token
            except Token.DoesNotExist:
                token = Token.objects.create(user=obj)  # if Token doesn't exist, create Token
        return token.key

class PasswordChangeSerializer(serializers.Serializer):
    current_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)

    def validate_current_password(self, value):
        if not self.context['request'].user.check_password(value):
            raise serializers.ValidationError('Current password does not match')
        return value

    def validate_new_password(self, value):
        password_validation.validate_password(value)
        return value

class EmptySerializer(serializers.Serializer):
    pass

class StaffSerializer(serializers.ModelSerializer):
    class Meta:
        model = Staff
        fields = "__all__"

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = "__all__"

class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = "__all__"

class ReviewSerializer(serializers.ModelSerializer):
    review_location = LocationSerializer(many=True, read_only=True)
    review_customer = UserSerializer(many=True, read_only=True)
    review_staff = StaffSerializer(many=True, read_only=True)
    class Meta:
        model = Review
        fields = "__all__"

    def create(self, validated_data):
        return Review.objects.create(**validated_data)

class LoginSerializer(RestAuthLoginSerializer):
    email = None

class RegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input_type': 'password'}, write_only=True)
    class Meta:
        model = CustomUser
        fields = ['first_name', 'last_name', 'email', 'phone', 'password', 'password2', 'date_of_birth']
        extra_kwargs = {
            'password': {'write_only': True},
        }
    def save(self):
        account = CustomUser(
            first_name=self.validated_data['first_name'],
            last_name=self.validated_data['last_name'],
            email=self.validated_data['email'],
            phone=self.validated_data['phone'],
            date_of_birth=self.validated_data['date_of_birth'],
        )
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password != password2:
            raise serializers.ValidationError({'password': 'Passwords must match.'})
        account.set_password(password)
        account.save()
        return account