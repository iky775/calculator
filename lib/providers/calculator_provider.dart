// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; 

class CalculatorProvider with ChangeNotifier {

  String _displayText = '0';
  String _result = '';


  String get displayText => _displayText;
  String get result => _result;


  void onButtonPress(String buttonText) {
    if (buttonText == 'AC') {
      _reset();
    } else if (buttonText == 'DEL') {
      _delete();
    } else if (buttonText == '=') {
      _calculateResult();
    } else {
      _addInput(buttonText);
    }

    notifyListeners();
  }

  void _reset() {
    _displayText = '0';
    _result = '';
  }

  void _delete() {
    if (_displayText.length > 1) {
      _displayText = _displayText.substring(0, _displayText.length - 1);
    } else {
      _displayText = '0';
    }
  }

  void _addInput(String value) {
    if (_displayText == '0') {
      _displayText = value;
    } else {
      _displayText += value;
    }
  }

  void _calculateResult() {

    try {
      
      String finalExpression = _displayText
          .replaceAll('x', '*')
          .replaceAll(':', '/');

      Parser p = Parser();
      Expression exp = p.parse(finalExpression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

 
      _result = eval.toString();
     
      if (_result.endsWith(".0")) {
        _result = _result.substring(0, _result.length - 2);
      }
    } catch (e) {
      _result = "Error";
    }
  }
}
