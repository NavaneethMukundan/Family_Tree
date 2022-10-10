import 'package:family_tree/features/main/view/splash.dart';
import 'package:family_tree/features/register/controller/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SigninController())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Tree',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashSceen(),
      ),
    );
  }
}
