// lib/models/cart.dart - Cart data model
class CartItem {
  final String serviceId;
  final int quantity;

  CartItem({required this.serviceId, required this.quantity});
}

class Cart {
  final String userId;
  final List<CartItem> items;
  final double totalPrice;

  Cart({
    required this.userId,
    required this.items,
    required this.totalPrice,
  });

  // Factory for mock data
  factory Cart.fromMock(String userId) {
    return Cart(
      userId: userId,
      items: [CartItem(serviceId: 'service_1', quantity: 1)],
      totalPrice: 500.0,
    );
  }
}