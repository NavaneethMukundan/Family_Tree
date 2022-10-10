import 'package:flutter/cupertino.dart';

class SigninController extends ChangeNotifier {
  final secretkey = TextEditingController();

  bool _isHidden = false;
  get isHidden => _isHidden;
  set isHidden(value) {
    _isHidden = value;
    notifyListeners();
  }
}
