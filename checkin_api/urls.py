from django.urls import path, include
from rest_framework.routers import SimpleRouter
from .views import *
from . import views
from rest_framework.authtoken.views import obtain_auth_token
app_name = "checkin_api"

router = SimpleRouter()
# router.register('reviews', ReviewViewSet, basename='reviews')
router.register('staffs', StaffViewSet, basename='staffs')
router.register('customers', CustomUserViewSet, basename='customers')
router.register('services', ServiceViewSet, basename='services')
router.register('locations', LocationViewSet, basename='locations')
router.register('auth', AuthViewSet, basename='auth')

urlpatterns = [
    # path for web pages
    path('', views.homepage, name='homepage'),
    # path('submit_review/', views.submit_review, name='submit_review'),
    path('review/', views.reviewpage, name="review"),
    path('login/', views.login_request, name="login"),
    path('register/', views.register, name="register"),
    path('logout/', views.logout_request, name="logout"),
    # paths for APIs
    path('v1/', include(router.urls)),
    path('v1/reviews/', ReviewList.as_view(), name='review-list'),
    path('v1/reviews/<int:pk>/', ReviewDetail.as_view(), name='review-detail'),
    # path('v1/register/', registration_view, name="register"),
]