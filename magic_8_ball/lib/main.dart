import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("8 magic ball"),
        ),
      ),
      body: myAppp(),
    ),
  ));
}

class myAppp extends StatefulWidget {
  @override
  State<myAppp> createState() => _myApppState();
}

class _myApppState extends State<myAppp> {
  int ans = 0;
  void changeBall() {
    setState(() {
      ans = new Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        changeBall();
      },
      child: Center(
        child: Image.asset('images/ans$ans.png'),
      ),
    );
  }
}
