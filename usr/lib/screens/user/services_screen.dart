// lib/screens/user/services_screen.dart - Service browsing
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/services_provider.dart';
import '../../widgets/service_card.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final servicesProvider = Provider.of<ServicesProvider>(context);
    final services = servicesProvider.services;

    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceCard(
            service: service,
            onAddToCart: () => servicesProvider.addToCart(service.id),
          );
        },
      ),
    );
  }
}