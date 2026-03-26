// lib/models/service.dart - Service data model
class Service {
  final String id;
  final String name;
  final String category; // Facial, Bridal Makeup, Mehndi, Stitching
  final double price;

  Service({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
  });

  // Factory for mock data
  factory Service.fromMock(int index) {
    const categories = ['Facial', 'Bridal Makeup', 'Mehndi', 'Stitching'];
    return Service(
      id: 'service_$index',
      name: 'Service $index',
      category: categories[index % categories.length],
      price: (index + 1) * 100.0, // Mock prices
    );
  }
}