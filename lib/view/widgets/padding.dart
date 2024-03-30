import 'package:flutter/material.dart';

class CustomePadding extends StatelessWidget {
  Widget child;
  CustomePadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
      child: child,
    );
  }
}
