from django.urls import path, include
from rest_framework.routers import SimpleRouter
from .views import *
from rest_framework.authtoken.views import obtain_auth_token

router = SimpleRouter()
# router.register('reviews', ReviewViewSet, basename='reviews')
router.register('staffs', StaffViewSet, basename='staffs')
router.register('customers', CustomUserViewSet, basename='customers')
router.register('services', ServiceViewSet, basename='services')
router.register('locations', LocationViewSet, basename='locations')
router.register('auth', AuthViewSet, basename='auth')

urlpatterns = [
    path('', include(router.urls)),
    # path('login/', ObtainAuthTokenView.as_view(), name='login'),
    path('reviews/', ReviewList.as_view(), name='review-list'),
    path('reviews/<int:pk>/', ReviewDetail.as_view(), name='review-detail'),
    # path('register/', registration_view, name="register"),
]