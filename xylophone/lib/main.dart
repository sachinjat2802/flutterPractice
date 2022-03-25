import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(child: myApp()),
      ),
    ),
  );
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    AudioCache audioCache = AudioCache();

    play(a) async {
      await audioCache.play(a);
    }

    Expanded sound(a, b) {
      return Expanded(
        child: FlatButton(
          color: b,
          onPressed: () {
            play(a);
          },
          child: Center(),
        ),
      );
    }

    return Column(
      children: [
        sound("note1.wav", const Color.fromARGB(255, 16, 172, 211)),
        sound("note2.wav", const Color.fromARGB(255, 52, 219, 10)),
        sound("note3.wav", const Color.fromARGB(255, 224, 17, 162)),
        sound("note4.wav", const Color.fromARGB(255, 228, 54, 11)),
        sound("note5.wav", const Color.fromARGB(255, 46, 11, 204)),
        sound("note6.wav", const Color.fromARGB(255, 183, 185, 18)),
        sound("note7.wav", const Color.fromARGB(255, 35, 207, 19)),
      ],
    );
  }
}
