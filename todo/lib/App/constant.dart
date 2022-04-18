import 'package:flutter/material.dart';

const sizedBox = SizedBox(
  height: 10,
);
const boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);
const text = Text(
  'ADD TASK',
  textAlign: TextAlign.center,
  style: TextStyle(
    color: Colors.lightBlueAccent,
    fontSize: 30,
    fontWeight: FontWeight.w700,
  ),
);

var container = Container(
  decoration: BoxDecoration(
    color: Colors.lightBlueAccent,
  ),
  child: Text(
    'Add Task',
    style: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  ),
);
