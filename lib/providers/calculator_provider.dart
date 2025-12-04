// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Kita butuh bantuan library ini untuk hitungan kompleks, TAPI untuk tugas sederhana kita pakai logika manual dulu agar paham konsepnya.

class CalculatorProvider with ChangeNotifier {
  // State: Data yang akan berubah-ubah [cite: 6]
  String _displayText = '0';
  String _result = '';

  // Getter untuk mengambil data dari UI
  String get displayText => _displayText;
  String get result => _result;

  // Fungsi untuk menangani input tombol
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

    // Memberi tahu UI bahwa data berubah agar di-rebuild [cite: 90, 101]
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
