import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/services_provider.dart';
import '../../providers/app_provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Choose Payment Method', style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                _processPayment(context, 'Online', app);
              },
              child: const Text('Pay Online (Razorpay/Stripe)'),
            ),
            ElevatedButton(
              onPressed: () {
                _processPayment(context, 'Cash', app);
              },
              child: const Text('Cash on Delivery'),
            ),
          ],
        ),
      ),
    );
  }

  void _processPayment(BuildContext context, String method, AppProvider app) {
    // Mock processing - in real app, integrate via Supabase
    app.showNotification('Booking Confirmed', 'Your booking is confirmed via $method!');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment via $method processed! Booking confirmed.')));
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }
}