import 'package:flutter/material.dart';

class WeightCalculation with ChangeNotifier {
  int _weight = 50;
  int get weight => _weight;

  addweight() {
    _weight++;
    notifyListeners();
  }

  subtractweight() {
    if (_weight > 0) {
      _weight--;
    } else {
      _weight = 0;
    }
    notifyListeners();
  }
}
