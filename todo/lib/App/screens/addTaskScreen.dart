import 'package:flutter/material.dart';
import 'package:todo/App/constant.dart';

Widget builder(BuildContext context) {
  return Container(
    height: 400,
    decoration: boxDecoration,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        text,
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            onChanged: (value) {
              print(value);
            },
            autofocus: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: container,
        )
      ],
    ),
  );
}
