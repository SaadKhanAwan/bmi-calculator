import 'package:flutter/material.dart';

class AgeCalculation with ChangeNotifier {
  int _age = 18;
  int get age => _age;

  addage() {
    _age++;
    notifyListeners();
  }

  subtractage() {
    if (_age > 0) {
      _age--;
    } else {
      _age = 0;
    }
    notifyListeners();
  }
}
