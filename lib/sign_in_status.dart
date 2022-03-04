import 'package:flutter/foundation.dart';

class SignInStatus extends ChangeNotifier {
  var _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  set isSignedIn(bool value) {
    _isSignedIn = value;
    notifyListeners();
  }
}
