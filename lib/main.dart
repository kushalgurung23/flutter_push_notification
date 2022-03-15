import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notification/data/firebase/background_remote_message.dart';
import 'package:flutter_push_notification/logic/providers/home_screen_provider.dart';
import 'package:flutter_push_notification/presentation/views/home_screen.dart';
import 'package:flutter_push_notification/presentation/views/successful_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // It will call native code before calling runApp, since Firebase.initializeApp() requires it.
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing firebase
  await Firebase.initializeApp();
  // To get message from background notification
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Push Notification',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => ChangeNotifierProvider(
              create: (context) => HomeScreenProvider(context: context),
              child: const HomeScreen(),
            ),
        SuccessfulScreen.id: (context) => const SuccessfulScreen()
      },
    );
  }
}
