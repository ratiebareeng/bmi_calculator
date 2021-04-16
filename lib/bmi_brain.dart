import 'dart:math';

import 'package:flutter/cupertino.dart';

const overweight = 'OVER WEIGHT';
const underweight = 'UNDER WEIGHT';
const normalweight = 'NORMAL WEIGHT';

class BmiBrain {
  final int height, weight;
  double _bmiResult;
  String resultText, interpretation;

  BmiBrain({@required this.height, @required this.weight});

  String getBmi() {
    _bmiResult = weight / pow(height / 100, 2);
    return _bmiResult.toStringAsFixed(1);
  }

  String getTextResult() {
    if (_bmiResult >= 25) {
      return overweight;
    } else if (_bmiResult >= 18.5) {
      return normalweight;
    } else {
      return underweight;
    }
  }

  String getInterpretation() {
    if (_bmiResult >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmiResult >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}
