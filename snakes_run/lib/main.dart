import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 1.0;
    double height = 1.0;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.blue,
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Text('snake'),
                  ),
                ),
              ),
              Joystick(
                listener: (details) {
                  print('X: ${details.x}');
                  print('Y: ${details.y}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
