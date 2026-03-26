// lib/providers/auth_provider.dart - Auth state management (MVC: Controller)
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _currentUser != null;
  bool get isAdmin => _currentUser?.role == 'admin';

  // Mock login - in real app, call Supabase API
  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1)); // Mock delay
    if (email == 'admin@smart.com' && password == 'password') {
      _currentUser = User.fromMock(0); // Admin
    } else if (email == 'user@smart.com' && password == 'password') {
      _currentUser = User.fromMock(1); // User
    } else {
      throw Exception('Invalid credentials');
    }
    await _saveUserToPrefs();
    _isLoading = false;
    notifyListeners();
  }

  // Mock register
  Future<void> register(String name, String phone, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _currentUser = User(
      id: 'user_new',
      name: name,
      phone: phone,
      email: email,
      password: password,
      role: 'user',
    );
    await _saveUserToPrefs();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
  }

  Future<void> _saveUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', _currentUser!.email); // Simple persistence
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('user');
    if (email != null) {
      // Mock reload
      if (email == 'admin@smart.com') _currentUser = User.fromMock(0);
      else _currentUser = User.fromMock(1);
      notifyListeners();
    }
  }
}