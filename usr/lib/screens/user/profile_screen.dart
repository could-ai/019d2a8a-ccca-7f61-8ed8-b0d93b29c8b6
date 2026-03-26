import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Name: ${user?.name}'),
            Text('Phone: ${user?.phone}'),
            Text('Email: ${user?.email}'),
            Text('Address: ${user?.address}'),
            const Text('Bank Details: Optional (not implemented yet)'),
            ElevatedButton(
              onPressed: () {
                app.showNotification('Profile', 'Profile updated!');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated (mock)')));
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}