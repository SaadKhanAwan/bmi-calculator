import 'package:flutter/material.dart';

class Slidervalue with ChangeNotifier {
  int _currentSliderValue = 120;
  int get currentvalue => _currentSliderValue;

  changevalue(double value) {
    _currentSliderValue = value.round();
    notifyListeners();
  }
}
