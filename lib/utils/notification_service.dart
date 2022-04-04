import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          importance: Importance.max),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final initializationSettings = InitializationSettings(android: AndroidInitializationSettings('icon'));
    await _notifications.initialize(initializationSettings,
        onSelectNotification: (payload) async {});
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
