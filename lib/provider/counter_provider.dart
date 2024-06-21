import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }

  void changeCounter(bool isAdd) {
    if (isAdd) {
      count++;
    } else {
      count--;
    }

    notifyListeners();
  }
}
