import 'package:family_tree/features/forms/controller/form.dart';
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
      providers: [
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => FormController())
      ],
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
