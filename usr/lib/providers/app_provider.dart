import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppProvider with ChangeNotifier {
  final AuthProvider auth;
  final ServicesProvider services;
  FlutterLocalNotificationsPlugin? _notifications;

  AppProvider({required this.auth, required this.services}) {
    _initNotifications();
  }

  void initializeApp() {
    auth.loadUser();
    _requestLocationPermission(); // Mock location filtering
  }

  void _initNotifications() {
    _notifications = FlutterLocalNotificationsPlugin();
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    _notifications!.initialize(initializationSettings);
  }

  Future<void> showNotification(String title, String body) async {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails('channel_id', 'Smart Sakhi'),
      iOS: DarwinNotificationDetails(),
    );
    await _notifications!.show(0, title, body, notificationDetails);
  }

  Future<void> _requestLocationPermission() async {
    // Mock: Check location for service filtering
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      // Filter services based on location (mock logic)
      print('Location enabled - services filtered');
    }
  }
}