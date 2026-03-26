// lib/services/mock_services_service.dart - Mock services abstraction
class MockServicesService {
  // Placeholder for API calls
  Future<List<dynamic>> fetchServices() async {
    await Future.delayed(const Duration(seconds: 1));
    return []; // Mock data handled in provider
  }

  Future<bool> createBooking(Map<String, dynamic> bookingData) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}