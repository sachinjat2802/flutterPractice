import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

Hero hero(height) {
  return Hero(
    tag: 'logo',
    child: Container(
      child: Image.asset('images/logo.png'),
      height: height,
    ),
  );
}

SizedBox sizedBox() {
  return SizedBox(
    child: DefaultTextStyle(
      style: const TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Bobbers',
        color: Colors.black,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText('Flash Chat__'),
        ],
        onTap: () {
          TyperAnimatedText('Flash Chat__');
        },
      ),
    ),
  );
}

Padding padding(onPressed, color, text) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          text,
        ),
      ),
    ),
  );
}

InputDecoration inputDecoration(text) {
  return InputDecoration(
    hintText: text,
    hintStyle: TextStyle(color: Colors.black),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}
