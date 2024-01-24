import 'package:flutter/material.dart';

enum Gender { male, female }

class GenderColor with ChangeNotifier {
  Gender? _selectedGender;
  Gender? get gender => _selectedGender;

  Color getMaleColor(Color active, Color inactive) {
    return (_selectedGender == Gender.male) ? active : inactive;
  }

  Color getFemaleColor(Color active, Color inactive) {
    return (_selectedGender == Gender.female) ? active : inactive;
  }

  void setSelectedGender(Gender gender) {
    _selectedGender = gender;
    notifyListeners(); // Notify listeners when the selected gender changes
  }
}
