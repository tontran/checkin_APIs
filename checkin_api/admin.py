from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from tinymce.widgets import TinyMCE

from .forms import CustomUserCreationForm, CustomUserChangeForm
from django.apps import apps
from .models import *

models = apps.get_models()

@admin.register(apps.get_model("checkin_api", "CustomUser"))
class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    # model = CustomUser
    list_display = ('email', 'is_staff', 'is_active',)
    list_filter = ('email', 'is_staff', 'is_active',)
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name', 'date_of_birth', 'phone')}),
        ('Permissions', {'fields': ('is_staff',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'first_name', 'last_name', 'phone', 'date_of_birth', 'password1', 'password2', 'is_staff', 'is_active')}
        ),
    )
    search_fields = ('email',)
    ordering = ('email',)

    class Meta:
        model = apps.get_model('checkin_api', 'CustomUser')

@admin.register(apps.get_model("checkin_api", "Staff"))
class StaffAdmin(admin.ModelAdmin):
    class Meta:
        model = apps.get_model("checkin_api", "Staff")

@admin.register(apps.get_model("checkin_api", "Location"))
class LocationAdmin(admin.ModelAdmin):
    class Meta:
        model = apps.get_model("checkin_api", "Location")

@admin.register(apps.get_model("checkin_api", "Service"))
class ServiceAdmin(admin.ModelAdmin):
    class Meta:
        model = apps.get_model("checkin_api", "Service")

@admin.register(apps.get_model("checkin_api", "Review"))
class ReviewAdmin(admin.ModelAdmin):
    fieldsets = [
        ("Content", {"fields": ["content"]}),
        ("Rating", {'fields': ["rating", "location"]}),
        ("Staff/Customer", {'fields': ["staff", "customer"]}),
    ]
    # formfield_overrides = {
    #     models.TextField: {'widget': TinyMCE()},
    # }

    # class Meta:
    #     model = apps.get_model("checkin_api", "Review")