import 'package:flutter/material.dart';
import 'home.dart';

class MYApp extends StatelessWidget {
  const MYApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 17, 96, 128),
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 5, 40, 63),
          )),
      home: Home(),
    );
  }
}
