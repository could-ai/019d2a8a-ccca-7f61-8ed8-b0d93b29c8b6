// lib/screens/admin/admin_dashboard.dart - Admin dashboard
import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/add_booking'), child: const Text('Add Booking (Diary)')),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/manage_bookings'), child: const Text('Manage Bookings')),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/manage_services'), child: const Text('Manage Services')),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/reports'), child: const Text('Reports')),
        ],
      ),
    );
  }
}