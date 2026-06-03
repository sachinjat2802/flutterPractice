import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text('🎲🎲🎲'),
        ),
      ),
      body: myapp(),
    ),
  ));
}

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _nameState();
}

class _nameState extends State<myapp> {
  @override
  int num = 6;
  int nums = 1;
  void changeFace() {
    setState(() {
      num = new Random().nextInt(6) + 1;
      nums = new Random().nextInt(6) + 1;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeFace();

                  print('left button pressed $num');
                },
                child: Image.asset('images/d$num.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  changeFace();
                  print('right button pressed   $nums');
                },
                child: Image.asset('images/d$nums.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
