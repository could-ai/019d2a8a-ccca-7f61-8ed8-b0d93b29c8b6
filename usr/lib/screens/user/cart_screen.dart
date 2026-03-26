// lib/screens/user/cart_screen.dart - Cart with total calculation
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/services_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesProvider = Provider.of<ServicesProvider>(context);
    final cart = servicesProvider.cart;
    final services = servicesProvider.services;

    if (cart == null || cart.items.isEmpty) {
      return Scaffold(appBar: AppBar(title: const Text('Cart')), body: const Center(child: Text('Cart is empty')));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                final service = services.firstWhere((s) => s.id == item.serviceId);
                return ListTile(
                  title: Text(service.name),
                  subtitle: Text('Qty: ${item.quantity} - ₹${service.price * item.quantity}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => servicesProvider.removeFromCart(service.id),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total: ₹${cart.totalPrice}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/booking'), child: const Text('Proceed to Booking')),
        ],
      ),
    );
  }
}