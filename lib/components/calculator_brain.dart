import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    calculateBMI();
    if (_bmi >= 25.0) {
      return 'You are overweight';
    }
    if (_bmi > 18.5) {
      return 'Just right';
    } else {
      return 'Waaaay too skinny';
    }
  }

  String getInterpretation() {
    calculateBMI();
    if (_bmi >= 25.0) {
      return 'Go do some running';
    }
    if (_bmi > 18.5) {
      return 'Well, hello there!';
    } else {
      return "Eat! You're all skin and bones";
    }
  }
}
