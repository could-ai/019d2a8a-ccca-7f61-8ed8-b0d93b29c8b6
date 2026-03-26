// lib/screens/user/home_screen.dart - User home/dashboard
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/services_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final services = Provider.of<ServicesProvider>(context);
    services.loadMockData(auth.currentUser!.id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Sakhi App'),
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, '/profile'), icon: const Icon(Icons.person)),
          IconButton(onPressed: () => auth.logout(), icon: const Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Welcome!', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/services'), child: const Text('Browse Services')),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/cart'), child: const Text('View Cart')),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/booking'), child: const Text('New Booking')),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/chatbot'), child: const Text('AI Assistant')),
          if (auth.isAdmin) ...[
            const Divider(),
            const Text('Admin Panel', style: TextStyle(fontSize: 18)),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/admin_dashboard'), child: const Text('Admin Dashboard')),
          ],
        ],
      ),
    );
  }
}