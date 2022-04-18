import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback(),
      home: Calc(),
    );
  }
}

class Calc extends StatelessWidget {
  late int num1;
  late int num2;
  late int result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: const Text('calc'),
        ),
      ),
      body: Column(children: [
        Container(
          color: Colors.black12,
          child: TextField(
            keyboardType: TextInputType.number,
            autofocus: true,
            textAlign: TextAlign.end,
            onChanged: ((value) => {num1 = value as int, print(value)}),
          ),
        ),
        Container(
          color: Colors.black12,
          child: TextField(
            keyboardType: TextInputType.number,
            autofocus: true,
            textAlign: TextAlign.end,
            onChanged: ((value) => {num2 = value as int, print(value)}),
          ),
        )
      ]),
    );
  }
}
