from django.contrib.auth.forms import UserCreationForm, UserChangeForm, AuthenticationForm
from django.core.exceptions import ValidationError, NON_FIELD_ERRORS
from django.utils.translation import gettext_lazy as _
from django import forms
from .models import CustomUser, Review, Location, Staff

class CustomUserCreationForm(forms.ModelForm):
    # class Meta(UserCreationForm):
    password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'type': 'password', 'name': 'password'}))
    password2 = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'type': 'password', 'name': 'password2'}))
    date_of_birth = forms.CharField(widget=forms.TextInput(
        attrs={'class': 'datepicker', 'type': 'text', 'name': 'date_of_birth'}))
    class Meta:
        model = CustomUser
        fields = ('email', 'password', 'password2', 'first_name', 'last_name', 'date_of_birth', 'phone')


    def clean_email(self):
        email = self.cleaned_data.get('email')
        if CustomUser.objects.filter(email=email).exists():
            raise ValidationError("This email already exists")
        return email

    def clean_password2(self):
        password = self.cleaned_data.get('password')
        password2 = self.cleaned_data.get('password2')
        if password and password2 and password != password2:
            raise ValidationError("Password didn't match")
        return password2

    def clean_phone(self, *args, **kwargs):
        phone = self.cleaned_data.get('phone')
        if CustomUser.objects.filter(phone=phone).exists():
            raise ValidationError("This phone already exists")
        return phone

    def save(self, commit=True):
        user = super(CustomUserCreationForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        user.password = self.cleaned_data['password']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.date_of_birth = self.cleaned_data['date_of_birth']
        user.phone = self.cleaned_data['phone']
        if commit:
            user.save()
        return user

class CustomUserLogInForm(forms.Form):
    email = forms.EmailField(widget=forms.TextInput(
        attrs={'class': 'form-control', 'type': 'text', 'name': 'email', 'placeholder': 'Email'}),
        label='Email')
    password = forms.CharField(widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'type': 'password', 'name': 'password', 'placeholder': 'Password'}),
        label='Password')
    class Meta:
        fields = ('email', 'password')

class CustomUserChangeForm(UserChangeForm):
    class Meta:
        model = CustomUser
        fields = ('email','first_name', 'last_name',)

class ReviewSubmitForm(forms.ModelForm):
    # content = forms.CharField(widget=forms.Textarea(
    #     attrs={'class': 'form-control', 'row': 10, 'cols': 20, 'name': 'content', 'placeholder': 'Content'}),
    #     label='Content')
    # rating = forms.FloatField(widget=forms.NumberInput(
    #     attrs={'class': 'form-control', 'type': 'number', 'name': 'rating', 'placeholder': '0.0'}
    # ))
    location = forms.ModelChoiceField(queryset=Location.objects.all(), empty_label='Select a location')
    staff = forms.ModelChoiceField(queryset=Staff.objects.all().order_by('first_name'),
                                   empty_label='Select a staff')

    customer = forms.ModelChoiceField(queryset=CustomUser.objects.all().order_by('first_name'),
                                   empty_label='Select a customer')

    class Meta:
        model = Review
        fields = ('content', 'rating', 'location', 'staff', 'customer')
    def save(self, commit=True):
        review = super(ReviewSubmitForm, self).save(commit=False)
        review.content = self.cleaned_data['content']
        review.rating = self.cleaned_data['rating']
        review.location = self.cleaned_data['location']
        review.staff = self.cleaned_data['staff']
        review.customer = self.cleaned_data['customer']
        if commit:
            review.save()
        return review