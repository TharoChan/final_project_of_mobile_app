import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void changeToSystemMode() {
    _themeIndex = 0;
    notifyListeners();
  }

  void changeToLightMode() {
    _themeIndex = 1;
    notifyListeners();
  }

  void changeToDarkMode() {
    _themeIndex = 2;
    notifyListeners();
  }
}
