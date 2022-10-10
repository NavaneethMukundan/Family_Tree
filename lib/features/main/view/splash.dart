import 'package:family_tree/features/main/view/onboard.dart';
import 'package:family_tree/utils/routes.dart';
import 'package:flutter/material.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({Key? key}) : super(key: key);

  @override
  State<SplashSceen> createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  @override
  void initState() {
    splashTimer(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050504),
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }

  Future<void> splashTimer(context) async {
    await Future.delayed(const Duration(seconds: 3));
    RouteController.pushReplacementRoute(context, const OnBoardScreen());
  }
}
