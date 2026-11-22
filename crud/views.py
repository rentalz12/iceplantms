from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Q
from django.core.paginator import Paginator
from django.http import JsonResponse
from datetime import datetime
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import Inventory, Customer, Order, OrderItem
from .forms import InventoryForm, CustomerForm, OrderForm, OrderItemForm

# Create your views here.

def login_view(request):
    if request.user.is_authenticated:
        return redirect('dashboard')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            return redirect('dashboard')
        return render(request, 'auth/login.html', {'error': 'Invalid username or password.'})
    return render(request, 'auth/login.html')

def logout_view(request):
    logout(request)
    return redirect('login')


@login_required(login_url='login')
def dashboard(request):
    total_orders = Order.objects.count()
    pending_orders = Order.objects.filter(status='pending').count()
    confirmed_orders = Order.objects.filter(status='confirmed').count()
    delivered_orders = Order.objects.filter(status='delivered').count()
    cancelled_orders = Order.objects.filter(status='cancelled').count()
    total_revenue = sum(o.total for o in Order.objects.filter(status='delivered'))
    low_stock = Inventory.objects.filter(quantity__lte=10).order_by('quantity')
    recent_orders = Order.objects.select_related('customer').order_by('-order_date')[:5]
    total_customers = Customer.objects.count()
    total_products = Inventory.objects.count()

    return render(request, 'dashboard.html', {
        'total_orders': total_orders,
        'pending_orders': pending_orders,
        'confirmed_orders': confirmed_orders,
        'delivered_orders': delivered_orders,
        'cancelled_orders': cancelled_orders,
        'total_revenue': total_revenue,
        'low_stock': low_stock,
        'recent_orders': recent_orders,
        'total_customers': total_customers,
        'total_products': total_products,
    })


@login_required(login_url='login')
def inventory_list(request):
    query = request.GET.get('q', '')
    if query:
        items_list = Inventory.objects.filter(
            Q(name__icontains=query) |
            Q(size__icontains=query)
        ).order_by('name', 'size')
    else:
        items_list = Inventory.objects.all().order_by('name', 'size')
    paginator = Paginator(items_list, 10)
    page_number = request.GET.get('page')
    items = paginator.get_page(page_number)
    return render(request, 'inventory/list.html', {'items': items, 'query': query})

def inventory_add(request):
    form = InventoryForm(request.POST or None)
    if form.is_valid():
        item = form.save(commit=False)
        item.quantity = 0
        item.save()
        return redirect('inventory_list')
    return render(request, 'inventory/form.html', {'form': form})

@login_required(login_url='login')
def inventory_edit(request, pk):
    item = get_object_or_404(Inventory, pk=pk)
    form = InventoryForm(request.POST or None, instance=item)
    if form.is_valid():
        form.save()
        item.orderitem_set.filter(order__status='pending').update(
            item_name=item.name,
            item_size=item.size,
            item_price=item.price,
        )
        return redirect('inventory_list')
    return render(request, 'inventory/form.html', {'form': form})

@login_required(login_url='login')
def inventory_delete(request, pk):
    item = get_object_or_404(Inventory, pk=pk)
    if request.method == 'POST':
        item.delete()
        return redirect('inventory_list')
    return render(request, 'inventory/delete.html', {'item': item})

@login_required(login_url='login')
def inventory_update_stock(request, pk):
    if request.method == 'POST':
        import json
        data = json.loads(request.body)
        item = get_object_or_404(Inventory, pk=pk)
        quantity = int(data.get('quantity') or 0)
        if quantity >= 0:
            item.quantity = quantity
            item.save()
            return JsonResponse({'success': True, 'quantity': item.quantity})
        return JsonResponse({'success': False, 'error': 'Invalid quantity'})
    return JsonResponse({'success': False, 'error': 'Invalid method'}, status=405)


@login_required(login_url='login')
def customer_list(request):
    query = request.GET.get('q', '')
    if query:
        customers_list = Customer.objects.filter(
            Q(name__icontains=query) |
            Q(phone__icontains=query) |
            Q(address__icontains=query)
        ).order_by('name', 'address')
    else:
        customers_list = Customer.objects.all().order_by('name', 'address')
    paginator = Paginator(customers_list, 10)
    page_number = request.GET.get('page')
    customers = paginator.get_page(page_number)
    return render(request, 'customers/list.html', {'customers': customers, 'query': query})

@login_required(login_url='login')
def customer_add(request):
    form = CustomerForm(request.POST or None)
    if form.is_valid():
        form.save()
        return redirect('customer_list')
    return render(request, 'customers/form.html', {'form': form})

@login_required(login_url='login')
def customer_edit(request, pk):
    customer = get_object_or_404(Customer, pk=pk)
    form = CustomerForm(request.POST or None, instance=customer)
    if form.is_valid():
        form.save()
        customer.order_set.filter(status='pending').update(
            customer_name=customer.name,
            customer_phone=customer.phone,
            customer_address=customer.address,
        )
        return redirect('customer_list')
    return render(request, 'customers/form.html', {'form': form})

@login_required(login_url='login')
def customer_delete(request, pk):
    customer = get_object_or_404(Customer, pk=pk)
    if request.method == 'POST':
        customer.delete()
        return redirect('customer_list')
    return render(request, 'customers/delete.html', {'customer': customer})


@login_required(login_url='login')
def order_list(request):
    query = request.GET.get('q', '')
    orders_list = Order.objects.select_related('customer').order_by('-order_date')
    if query:
        orders_list = orders_list.filter(
            Q(id__icontains=query) |
            Q(customer__name__icontains=query) |
            Q(status__icontains=query)
        ).order_by('-order_date')
    paginator = Paginator(orders_list, 10)
    page_number = request.GET.get('page')
    orders = paginator.get_page(page_number)
    return render(request, 'orders/list.html', {'orders': orders, 'query': query})

@login_required(login_url='login')
def order_add(request):
    if request.method == 'POST':
        form = OrderForm(request.POST)
    else:
        form = OrderForm(initial={'order_date': datetime.now().strftime('%Y-%m-%dT%H:%M')})
    if form.is_valid():
        order = form.save(commit=False)
        customer = order.customer
        order.customer_name = customer.name
        order.customer_phone = customer.phone
        order.customer_address = customer.address
        order.save()
        return redirect('order_detail', pk=order.pk)
    return render(request, 'orders/form.html', {'form': form})

@login_required(login_url='login')
def order_edit(request, pk):
    order = get_object_or_404(Order, pk=pk)
    if order.status != 'pending':
        return redirect('order_detail', pk=pk)
    form = OrderForm(request.POST or None, instance=order)
    if form.is_valid():
        order = form.save()
        if order.customer:
            order.customer_name = order.customer.name
            order.customer_phone = order.customer.phone
            order.customer_address = order.customer.address
            order.save()
        return redirect('order_detail', pk=order.pk)
    return render(request, 'orders/form.html', {'form': form, 'order': order})

@login_required(login_url='login')
def order_detail(request, pk):
    order = get_object_or_404(Order, pk=pk)
    items = order.items.select_related('item').all()
    from_dashboard = request.GET.get('from') == 'dashboard'
    return render(request, 'orders/detail.html', {
        'order': order, 
        'items': items,
        'from_dashboard': from_dashboard
    })

@login_required(login_url='login')
def order_delete(request, pk):
    order = get_object_or_404(Order, pk=pk)
    if order.status not in ['pending', 'cancelled']:
        return redirect('order_detail', pk=pk)
    if request.method == 'POST':
        if order.status == 'pending':
            for order_item in order.items.select_related('item').all():
                if order_item.item:
                    order_item.item.quantity += order_item.quantity
                    order_item.item.save()
        order.delete()
        return redirect('order_list')
    return render(request, 'orders/delete.html', {'order': order})

@login_required(login_url='login')
def order_update_status(request, pk):
    order = get_object_or_404(Order, pk=pk)
    if request.method == 'POST':
        status = request.POST.get('status')
        if status in dict(Order.STATUS_CHOICES):
            if status == 'cancelled' and order.status != 'cancelled':
                for order_item in order.items.select_related('item').all():
                    if order_item.item:
                        order_item.item.quantity += order_item.quantity
                        order_item.item.save()
            elif order.status == 'cancelled' and status != 'cancelled':
                for order_item in order.items.select_related('item').all():
                    if order_item.item:
                        order_item.item.quantity -= order_item.quantity
                        order_item.item.save()
            if status == 'pending':
                if order.customer:
                    order.customer_name = order.customer.name
                    order.customer_phone = order.customer.phone
                    order.customer_address = order.customer.address
                for order_item in order.items.select_related('item').all():
                    if order_item.item:
                        order_item.item_name = order_item.item.name
                        order_item.item_size = order_item.item.size
                        order_item.item_price = order_item.item.price
                        order_item.save()
            order.status = status
            order.save()
            return redirect('order_detail', pk=pk)
    return redirect('order_detail', pk=pk)

@login_required(login_url='login')
def order_item_add(request, order_pk):
    order = get_object_or_404(Order, pk=order_pk)
    form = OrderItemForm(request.POST or None)
    if form.is_valid():
        order_item = form.save(commit=False)
        order_item.order = order
        inventory_item = order_item.item
        if inventory_item.quantity < order_item.quantity:
            form.add_error('quantity', 'Not enough stock available.')
        else:
            order_item.item_name = inventory_item.name
            order_item.item_size = inventory_item.size
            order_item.item_price = inventory_item.price
            order_item.save()
            inventory_item.quantity -= order_item.quantity
            inventory_item.save()
            return redirect('order_detail', pk=order_pk)
    return render(request, 'orders/item_form.html', {'form': form, 'order': order})

@login_required(login_url='login')
def order_item_edit(request, order_pk, pk):
    order = get_object_or_404(Order, pk=order_pk)
    order_item = get_object_or_404(OrderItem, pk=pk, order=order)
    old_quantity = order_item.quantity
    old_inventory_item = order_item.item
    selected_stock = old_inventory_item.quantity if old_inventory_item else None
    form = OrderItemForm(request.POST or None, instance=order_item)
    if form.is_valid():
        new_quantity = form.cleaned_data['quantity']
        new_inventory_item = form.cleaned_data['item']
        item_changed = old_inventory_item != new_inventory_item

        if item_changed:
            if new_inventory_item.quantity < new_quantity:
                selected_stock = new_inventory_item.quantity
                form.add_error('quantity', 'Not enough stock.')
            else:
                form.save()
                order_item.item_name = new_inventory_item.name
                order_item.item_size = new_inventory_item.size
                order_item.item_price = new_inventory_item.price
                order_item.save()
                if old_inventory_item:
                    old_inventory_item.quantity += old_quantity
                    old_inventory_item.save()
                new_inventory_item.quantity -= new_quantity
                new_inventory_item.save()
                return redirect('order_detail', pk=order_pk)
        else:
            diff = new_quantity - old_quantity
            if diff > 0 and new_inventory_item.quantity < diff:
                selected_stock = new_inventory_item.quantity
                form.add_error('quantity', 'Not enough stock.')
            else:
                form.save()
                order_item.item_name = new_inventory_item.name
                order_item.item_size = new_inventory_item.size
                order_item.item_price = new_inventory_item.price
                order_item.save()
                new_inventory_item.quantity -= diff
                new_inventory_item.save()
                return redirect('order_detail', pk=order_pk)

    return render(request, 'orders/item_form.html', {
        'form': form,
        'order': order,
        'item': order_item,
        'selected_stock': selected_stock,
        'show_stock': selected_stock is not None,
    })

@login_required(login_url='login')
def order_item_delete(request, order_pk, pk):
    order = get_object_or_404(Order, pk=order_pk)
    order_item = get_object_or_404(OrderItem, pk=pk, order=order)
    if request.method == 'POST':
        if order_item.item:
            order_item.item.quantity += order_item.quantity
            order_item.item.save()
        order_item.delete()
        return redirect('order_detail', pk=order_pk)
    return redirect('order_detail', pk=order_pk)