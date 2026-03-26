import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class ServicesProvider with ChangeNotifier {
  // ... existing code ...

  void addBooking(Booking booking) {
    _bookings.add(booking);
    Provider.of<AppProvider>(null, listen: false).showNotification('New Booking', 'Booking added for ${booking.customerName}');
    notifyListeners();
  }

  // ... rest of code ...
}