from django import forms
from .models import Inventory, Customer, Order, OrderItem

class InventoryForm(forms.ModelForm):
    class Meta:
        model = Inventory
        fields = ['name', 'size', 'price']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'}),
            'size': forms.TextInput(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'}),
            'price': forms.NumberInput(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'}),
        }

class CustomerForm(forms.ModelForm):
    address = forms.CharField(
        widget=forms.Textarea(attrs={
            'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400',
            'rows': 3
        })
    )

    class Meta:
        model = Customer
        fields = ['name', 'address', 'phone']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'}),
            'phone': forms.TextInput(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'}),
        }

class OrderForm(forms.ModelForm):
    customer = forms.ModelChoiceField(
        queryset=Customer.objects.all().order_by('name', 'address'),
        empty_label="Select customer...",
        widget=forms.Select(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'})
    )
    order_date = forms.DateTimeField(
        widget=forms.DateTimeInput(
            attrs={
                'type': 'datetime-local',
                'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400',
            },
            format='%Y-%m-%dT%H:%M',
        ),
        input_formats=['%Y-%m-%dT%H:%M'],
    )

    class Meta:
        model = Order
        fields = ['customer', 'order_date']

class OrderItemForm(forms.ModelForm):
    quantity = forms.IntegerField(
        min_value=1,
        initial=1,
        widget=forms.NumberInput(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'})
    )

    class Meta:
        model = OrderItem
        fields = ['item', 'quantity']
        widgets = {
            'item': forms.Select(attrs={'class': 'w-full text-sm border border-frost-300 rounded-lg px-3 py-2 text-frost-800 focus:outline-none focus:ring-2 focus:ring-ice-400'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['item'].queryset = Inventory.objects.all().order_by('name', 'size')
        self.fields['item'].empty_label = "Select item..."
        self.fields['item'].label_from_instance = lambda obj: f"{obj.name} ({obj.size}) - Stock: {obj.quantity}"