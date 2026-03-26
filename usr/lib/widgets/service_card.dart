// lib/widgets/service_card.dart - Reusable service card widget
import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceCard extends StatelessWidget {
  final Service service;
  final VoidCallback onAddToCart;

  const ServiceCard({super.key, required this.service, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(service.name),
        subtitle: Text('${service.category} - ₹${service.price}'),
        trailing: ElevatedButton(
          onPressed: onAddToCart,
          child: const Text('Add to Cart'),
        ),
      ),
    );
  }
}