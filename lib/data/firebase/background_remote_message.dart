import 'package:firebase_messaging/firebase_messaging.dart';

// Receive message when app is in background. solution for on message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  if(message.notification!= null) print(message.notification!.title);
}
