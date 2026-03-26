// lib/models/user.dart - User data model (MVC: Model)
class User {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String password; // In real app, hashed; here for mock
  final String role; // 'user' or 'admin'
  final String? address;
  final Map<String, dynamic>? bankDetails;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.role,
    this.address,
    this.bankDetails,
  });

  // Factory for mock data
  factory User.fromMock(int index) {
    return User(
      id: 'user_$index',
      name: index == 0 ? 'Admin User' : 'User $index',
      phone: '123456789$index',
      email: index == 0 ? 'admin@smart.com' : 'user$index@smart.com',
      password: 'password', // Mock
      role: index == 0 ? 'admin' : 'user',
      address: 'Mock Address $index',
    );
  }
}