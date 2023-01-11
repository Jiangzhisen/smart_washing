"""myweb URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp import views

urlpatterns = [
    path("admin/", admin.site.urls),
    path('login/', views.login2_view),
    path('logout/', views.logout),
    path('api2/', views.api2),
    path('privacypolicy/', views.privacy_policy),
    path('privacypolicy2/', views.privacy_policy2),
    path('payment/', views.card),
    path('addcard/', views.add_card),
    path('index/', views.index),
    path('payment1/', views.card1),
    path('laundry/', views.laundry),
    path('purchase/', views.purchase),
    path('orderconfirmation/', views.order_confirmation),
    path('ordersent/', views.order_sent),
    path('ordertracking/', views.order_tracking),
    path('map/', views.map),
    path('historical/', views.historical),
    path('problemreturns/', views.problemreturns),
    path("reportsent/", views.report_sent),
    path('teaching/', views.teaching),
    path('finishconfirmation/', views.finish_confirmation),
    path('paymentconfirmation/', views.payment_confirmation),
    path('paymentcomplete/', views.payment_complete),
    path('washingconfirmation/', views.washing_confirmation),
    path('laundrysuccess/', views.laundry_success),
    path('addnotice/', views.addnotice),
    path('purchase2/', views.purchase2),
    path('purchaseCFM/', views.purchaseCFM),
    path('purchasesuccess/', views.purchasesuccess),
    path('purchasefail/', views.purchasefail),
    path('addpreference/', views.addpreference),
]

