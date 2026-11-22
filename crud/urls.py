from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),

    path('', views.dashboard, name='dashboard'),
    
    path('inventory/', views.inventory_list, name='inventory_list'),
    path('inventory/add/', views.inventory_add, name='inventory_add'),
    path('inventory/<int:pk>/edit/', views.inventory_edit, name='inventory_edit'),
    path('inventory/<int:pk>/delete/', views.inventory_delete, name='inventory_delete'),
    path('inventory/<int:pk>/update-stock/', views.inventory_update_stock, name='inventory_update_stock'),

    path('customers/', views.customer_list, name='customer_list'),
    path('customers/add/', views.customer_add, name='customer_add'),
    path('customers/<int:pk>/edit/', views.customer_edit, name='customer_edit'),
    path('customers/<int:pk>/delete/', views.customer_delete, name='customer_delete'),

    path('orders/', views.order_list, name='order_list'),
    path('orders/add/', views.order_add, name='order_add'),
    path('orders/<int:pk>/edit/', views.order_edit, name='order_edit'),
    path('orders/<int:pk>/', views.order_detail, name='order_detail'),
    path('orders/<int:pk>/delete/', views.order_delete, name='order_delete'),
    path('orders/<int:pk>/status/', views.order_update_status, name='order_update_status'),
    path('orders/<int:order_pk>/items/add/', views.order_item_add, name='order_item_add'),
    path('orders/<int:order_pk>/items/<int:pk>/edit/', views.order_item_edit, name='order_item_edit'),
    path('orders/<int:order_pk>/items/<int:pk>/delete/', views.order_item_delete, name='order_item_delete'),
]