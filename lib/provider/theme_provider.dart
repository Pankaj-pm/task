import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDart = false;

  void changeTheme() {
    isDart = !isDart;
    notifyListeners();
  }
}
