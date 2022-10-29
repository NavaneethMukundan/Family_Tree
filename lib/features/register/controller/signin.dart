import 'package:flutter/material.dart';

class SigninController extends ChangeNotifier {
  final secretkey = TextEditingController();
  final signInFormKeys = GlobalKey<FormState>();

  formValidation(context, Widget screen) {
    if (signInFormKeys.currentState!.validate()) {
      if (secretkey.text == 'PP@1879') {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => screen));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid Key')));
        // const Text('Please enter the Key');
      }
    }
  }

  bool _isHidden = false;
  get isHidden => _isHidden;
  set isHidden(value) {
    _isHidden = value;
    notifyListeners();
  }
}
