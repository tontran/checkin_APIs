from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _
from phone_field import PhoneField
from tinymce import models as tinymce_models

from .managers import CustomUserManager

# Custom User
class CustomUser(AbstractUser):
    username = None
    email = models.EmailField(_('email address'), unique=True)
    date_of_birth = models.DateField(null=True)
    phone = PhoneField(blank=False, help_text='Contact phone number', null=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['date_of_birth', 'phone', 'first_name', 'last_name']

    objects = CustomUserManager()

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

# Location
class Location(models.Model):
    name = models.CharField(max_length=255)
    address = models.CharField(max_length=255)
    phone = PhoneField(blank=False, help_text='Contact phone number', null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

# Staff
class Staff(models.Model):
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    email = models.EmailField(verbose_name="email", max_length=60, unique=True)
    date_of_birth = models.DateField(null=True)
    phone = PhoneField(blank=False, help_text='Contact phone number', null=True)
    is_active = models.BooleanField(default=True)
    start_date = models.DateField(null=True)
    end_date = models.DateField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    staff_location = models.ForeignKey(Location, related_name='staff_location', default=1, verbose_name="Locations", on_delete=models.SET_DEFAULT)

    def __str__(self):
        return self.first_name + ' ' + self.last_name


# Service
class Service(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

# Review
class Review(models.Model):
    # content = models.TextField()
    content = tinymce_models.HTMLField()
    rating = models.FloatField()
    location = models.ForeignKey(Location, related_name='review_location', null=True, on_delete=models.CASCADE)
    customer = models.ForeignKey(CustomUser, related_name='review_customer', null=True, on_delete=models.CASCADE)
    staff = models.ForeignKey(Staff, related_name='review_staff_location', null=True, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.customer.last_name + ' || ' + self.content