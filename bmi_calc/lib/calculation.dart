import 'dart:math';

import 'package:bmi_calc/constant.dart';
import 'package:bmi_calc/home.dart';

class Calc {
  Calc({required this.height, required this.weight});
  final int weight;
  final int height;
  double _bmi = 0;

  String bmiCalc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30) {
      return "Obesity";
    } else if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "UnnderWeight";
    }
  }

  String getInterption() {
    if (_bmi >= 30) {
      return " Engage in regular physical activity and exercise and Measure servings and control portions";
    } else if (_bmi >= 25) {
      return "Keep a food and weight diary";
    } else if (_bmi >= 18.5) {
      return "good going";
    } else {
      return "consume protien and carbohydrate diet";
    }
  }
}
