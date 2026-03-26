// lib/models/booking.dart - Booking data model
class Booking {
  final String id;
  final String customerName;
  final String? fatherName;
  final String phone;
  final String address;
  final DateTime date;
  final List<String> services; // List of service IDs
  final double totalAmount;
  final double advancePaid;
  final double remainingAmount;
  final String paymentMode; // 'Online' or 'Cash'
  final String bookingType; // 'Home' or 'Parlour'
  final String status; // 'Pending', 'Confirmed', 'Completed'
  final String? userId; // For user bookings

  Booking({
    required this.id,
    required this.customerName,
    this.fatherName,
    required this.phone,
    required this.address,
    required this.date,
    required this.services,
    required this.totalAmount,
    required this.advancePaid,
    required this.remainingAmount,
    required this.paymentMode,
    required this.bookingType,
    required this.status,
    this.userId,
  });

  // Factory for mock data
  factory Booking.fromMock(int index) {
    return Booking(
      id: 'booking_$index',
      customerName: 'Customer $index',
      fatherName: 'Father $index',
      phone: '987654321$index',
      address: 'Address $index',
      date: DateTime.now().add(Duration(days: index)),
      services: ['service_$index'],
      totalAmount: 500.0 + index * 100,
      advancePaid: 200.0,
      remainingAmount: 300.0 + index * 100,
      paymentMode: index % 2 == 0 ? 'Online' : 'Cash',
      bookingType: index % 2 == 0 ? 'Home' : 'Parlour',
      status: ['Pending', 'Confirmed', 'Completed'][index % 3],
      userId: 'user_1',
    );
  }
}