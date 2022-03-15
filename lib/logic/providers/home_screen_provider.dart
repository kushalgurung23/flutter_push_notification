import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_push_notification/logic/services/local_notification_service.dart';

class HomeScreenProvider extends ChangeNotifier {
  HomeScreenProvider({required BuildContext context}) {
    LocalNotificationService.initialize(context);

    // While on FOREGROUND, we listen to stream of remote messages
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
      }
      // For displaying notification and creating channel id
      LocalNotificationService.display(message);
    });

    // App should be on BACKGROUND and not closed for this property to work
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeMessage = message.data['route'];
      Navigator.of(context).pushNamed(routeMessage);
    });

    // Gives message from notification even when the app is TERMINATED
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeMessage = message.data['route'];
        Navigator.of(context).pushNamed(routeMessage);
      }
    });
  }
}
