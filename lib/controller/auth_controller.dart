import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  bool obscureText = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  clearController() {
    emailcontroller.clear();
    passwordcontroller.clear();

    notifyListeners();
  }

  isTextVisible() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
