import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 36, 151, 180),
        appBar: AppBar(
          title: Center(
            child: Text("I am Rich"),
          ),
          backgroundColor: Color.fromARGB(255, 182, 190, 216),
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/img.png'),
          ),
        ),
      ),
    ),
  );
}
