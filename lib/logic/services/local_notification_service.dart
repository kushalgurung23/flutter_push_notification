import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        Navigator.of(context).pushNamed(route);
      }
    });
  }

  // When app is on foreground, we have to use flutter local notification
  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
          // channel id: kushalgurung, channel name: kushalgurung_channel
          android: AndroidNotificationDetails(
              "kushalgurung", "kushalgurung_channel",
              channelDescription: "This is kushal's channel",
              importance: Importance.max,
              priority: Priority.high));
      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails,
          payload: message.data['route']);
    } catch (e) {
      throw Exception(e);
    }
  }
}
