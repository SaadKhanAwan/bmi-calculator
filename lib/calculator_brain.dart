import 'dart:math';

class Brain {
  final int height;
  final int weight;
  Brain({
    required this.height,
    required this.weight,
  });

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight".toUpperCase();
    } else if (_bmi > 18.5) {
      return "Normal".toLowerCase();
    } else {
      return "Underweight".toUpperCase();
    }
  }

  String getNotaition() {
    if (_bmi >= 25) {
      return "You have higher than normal body weight .Try to exercise more";
    } else if (_bmi > 18.5) {
      return "You have normal body weight.Good job";
    } else {
      return "You have a lower than normal body weight .You can eat a bit more";
    }
  }
}
