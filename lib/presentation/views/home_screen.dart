import 'package:flutter/material.dart';
import 'package:flutter_push_notification/logic/providers/home_screen_provider.dart';
import 'package:flutter_push_notification/presentation/helpers/size_configuration.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Consumer<HomeScreenProvider>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Push Notification'),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.white,
            child: const Center(
              child: Text('Home Screen'),
            ),
          ),
        );
      },
    );
  }
}
