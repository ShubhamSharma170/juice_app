import 'package:flutter/material.dart';

class JuicePageProvider with ChangeNotifier {
  final List<String> fruits = [
    "images/tomato.png",
    "images/watermelon.png",
    "images/pineapple.png",
    "images/banana.png",
    "images/apple.png",
  ];

  int _sugarCount = 0;

  String _selectedFruit1 = "images/tomato.png";
  String _selectedFruit2 = "images/tomato.png";
  String _selectedFruit3 = "images/tomato.png";

  String? get selectedFruit1 => _selectedFruit1;
  String? get selectedFruit2 => _selectedFruit2;
  String? get selectedFruit3 => _selectedFruit3;
  get sugarCount => _sugarCount;

  setSugarCount(val) {
    _sugarCount = val;
    notifyListeners();
  }

  setFruit1(String? val) {
    _selectedFruit1 = val!;
    notifyListeners();
  }

  setFruit2(String? val) {
    _selectedFruit2 = val!;
    notifyListeners();
  }

  setFruit3(String? val) {
    _selectedFruit3 = val!;
    notifyListeners();
  }
}
