import 'package:bmi_calc/constant.dart';
import 'package:bmi_calc/home.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key,
      required this.bmi,
      required this.result,
      required this.interption})
      : super(key: key);

  final String bmi;
  final String result;
  final String interption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BMI Calculator"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: RuCard(
                deActivecardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      bmi,
                      style: const TextStyle(
                          fontSize: 100, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        interption,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                () {}),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Center(
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              color: mainButtonColor,
              width: double.infinity,
              height: mainButtonHeight,
            ),
          )
        ],
      ),
    );
  }
}
