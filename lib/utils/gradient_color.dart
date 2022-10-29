import 'package:flutter/material.dart';

class GradientColorWidgets extends StatelessWidget {
  const GradientColorWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFFE8E8E8), Color(0XFF6F9040)])),
    );
  }
}
