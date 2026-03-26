import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';

class ManageBookingsScreen extends StatelessWidget {
  // ... existing code ...

  void _editBooking(BuildContext context, Booking booking, ServicesProvider provider) {
    final app = Provider.of<AppProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Status'),
        content: DropdownButton<String>(
          value: booking.status,
          items: ['Pending', 'Confirmed', 'Completed'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: (v) {
            provider.updateBooking(booking.id, Booking(
              id: booking.id,
              customerName: booking.customerName,
              fatherName: booking.fatherName,
              phone: booking.phone,
              address: booking.address,
              date: booking.date,
              services: booking.services,
              totalAmount: booking.totalAmount,
              advancePaid: booking.advancePaid,
              remainingAmount: booking.remainingAmount,
              paymentMode: booking.paymentMode,
              bookingType: booking.bookingType,
              status: v!,
            ));
            app.showNotification('Booking Updated', 'Status changed to $v');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}