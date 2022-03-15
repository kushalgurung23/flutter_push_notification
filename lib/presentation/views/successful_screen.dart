import 'package:flutter/material.dart';
import 'package:flutter_push_notification/presentation/helpers/size_configuration.dart';

class SuccessfulScreen extends StatelessWidget {
  static const String id = '/successful_screen';

  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.greenAccent,
          child: const Center(
            child: Text(
              'Successful screen',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
