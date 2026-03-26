import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class ReportsScreen extends StatelessWidget {
  // ... existing code ...

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppProvider>(context, listen: false);
    // ... existing code ...
    ElevatedButton(
      onPressed: () {
        app.showNotification('Report Generated', 'Earnings: ₹$totalEarnings');
      },
      child: const Text('Generate Report'),
    ),
    // ... rest of code ...
  }
}