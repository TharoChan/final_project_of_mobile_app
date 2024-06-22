import 'package:flutter/material.dart';

class FontSizeLogic extends ChangeNotifier {
  double _size = 0;
  double get size => _size;

  void increase() {
    _size++;
    notifyListeners();
  }

  void decrease() {
    _size--;
    notifyListeners();
  }
}
