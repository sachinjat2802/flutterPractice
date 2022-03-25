import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage('images/img.png'),
                ),
              ),
              Text(
                "SACHIN JAT",
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "FLUTTER & NODE DEVELOPER",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 25,
                  color: Colors.teal.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.teal.shade100),
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 3.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+919075371697',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 25,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 3.0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'sachinjat2802@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ],
          )),
        ),
      ),
    );
  }
}
