from django.contrib.auth.forms import UserCreationForm, UserChangeForm, AuthenticationForm
from django.core.exceptions import ValidationError
from django import forms
from .models import CustomUser, Review, Location, Staff

class CustomUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm):
        model = CustomUser
        fields = ('email', 'first_name', 'last_name', 'date_of_birth', 'phone')
    def clean_email(self):
        email = self.cleaned_data['email'].lower()
        r = CustomUser.objects.filter(email=email)
        if r.count():
            raise ValidationError("This email already exists")
        return email

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 and password2 and password1 != password2:
            raise ValidationError("Password don't match")
        return password2

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

    # def __init__(self, *args, **kwargs):
    #     super(ReviewSubmitForm, self).__init__(*args, **kwargs)
    #     self.fields['location'].queryset = Location.objects.all()


    class Meta:
        model = Review
        fields = ('content','rating', 'location', 'staff', 'customer')
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