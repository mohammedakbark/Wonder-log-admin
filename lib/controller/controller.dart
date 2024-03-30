import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  bool isVisible = false;
  isButtonClicked() {
    isVisible = !isVisible;
    notifyListeners();
  }
}
