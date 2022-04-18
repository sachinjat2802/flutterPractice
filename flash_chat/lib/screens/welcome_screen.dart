import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../widgit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                hero(60.0),
                sizedBox(),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            padding(() {
              Navigator.popAndPushNamed(context, LoginScreen.id);
            }, Colors.lightBlueAccent, 'Log In'),
            padding(() {
              Navigator.popAndPushNamed(context, RegistrationScreen.id);
            }, Colors.blueAccent, 'Register'),
          ],
        ),
      ),
    );
  }
}
