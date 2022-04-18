import 'package:control_pad/views/joystick_view.dart';
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
              JoystickView(
                size: 100,
                backgroundColor: Colors.grey,
                opacity: 0.1,
                showArrows: false,
                innerCircleColor: Colors.green,
                onDirectionChanged: (x, y) {
                  print('X:$x');
                  print('Y:$y');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
