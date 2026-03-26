import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class ManageServicesScreen extends StatefulWidget {
  // ... existing code ...

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context, listen: false);
    // ... existing code ...
    ElevatedButton(
      onPressed: () {
        final newService = Service(
          id: 'service_${DateTime.now().millisecondsSinceEpoch}',
          name: _nameController.text,
          category: _category,
          price: double.parse(_priceController.text),
        );
        services.add(newService);
        servicesProvider.notifyListeners();
        app.showNotification('Service Added', '${newService.name} added');
        _nameController.clear();
        _priceController.clear();
      },
      child: const Text('Add Service'),
    ),
    // ... rest of code ...
  }
}