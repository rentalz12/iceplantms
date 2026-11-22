from django.db import models
from datetime import datetime

# Create your models here.

class Inventory(models.Model):
    name = models.CharField(max_length=100)
    size = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=5, decimal_places=2)
    quantity = models.PositiveIntegerField(default=0)
    last_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name

class Customer(models.Model):
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=15)

    def __str__(self):
        return self.name

class Order(models.Model):
    STATUS_CHOICES = [
        ("pending", "Pending"),
        ("confirmed", "Confirmed"),
        ("delivered", "Delivered"),
        ("cancelled", "Cancelled"),
    ]
    customer = models.ForeignKey(Customer, on_delete=models.SET_NULL, null=True)
    customer_name = models.CharField(max_length=100, default='')
    customer_phone = models.CharField(max_length=15, default='')
    customer_address = models.CharField(max_length=255, default='')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="pending")
    order_date = models.DateTimeField(default=datetime.now)

    @property
    def total(self):
        return sum(item.quantity * item.item_price for item in self.items.all())

    def __str__(self):
        return f"Order #{self.pk} - {self.customer.name}"

class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, related_name="items")
    item = models.ForeignKey(Inventory, on_delete=models.SET_NULL, null=True)
    quantity = models.PositiveIntegerField()
    item_name = models.CharField(max_length=100, default='')
    item_size = models.CharField(max_length=50, default='')
    item_price = models.DecimalField(max_digits=5, decimal_places=2, default=0)

    @property
    def unit_price(self):
        return self.item_price

    @property
    def subtotal(self):
        return self.quantity * self.item_price

    def __str__(self):
        return f"{self.quantity}x {self.item_name}"