// lib/services/mock_auth_service.dart - Mock auth abstraction
class MockAuthService {
  // Placeholder for future API calls to Supabase/Node.js
  Future<bool> validateLogin(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return email == 'admin@smart.com' && password == 'password' || email == 'user@smart.com' && password == 'password';
  }

  Future<bool> registerUser(String name, String phone, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return true; // Mock success
  }
}