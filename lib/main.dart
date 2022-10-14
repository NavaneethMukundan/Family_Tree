import 'package:family_tree/features/forms/controller/form.dart';
import 'package:family_tree/features/home/view/home_screen.dart';
import 'package:family_tree/features/member/controllers/member_provider.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'package:family_tree/features/main/view/splash.dart';
import 'package:family_tree/features/member/models/member_model.dart';
import 'package:family_tree/features/register/controller/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => FamilyTreeProvider()),
        ChangeNotifierProvider(create: (_) => FormController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Family Tree',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  HomeScreen(member: Member()),  
      ),
    );
  }
}
