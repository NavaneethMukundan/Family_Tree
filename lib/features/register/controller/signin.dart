import 'package:flutter/material.dart';

class SigninController extends ChangeNotifier {
  final secretkey = TextEditingController();
  final signInFormKeys = GlobalKey<FormState>();

  formValidation(context, Widget screen) {
    print('btn clicked'); 
    if (signInFormKeys.currentState!.validate()) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => screen));
    } else {
      const Text('Please enter the Key');
    }
  }

  bool _isHidden = false;
  get isHidden => _isHidden;
  set isHidden(value) {
    _isHidden = value;
    notifyListeners();
  }
}
