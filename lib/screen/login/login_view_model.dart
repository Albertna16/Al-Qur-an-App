import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  bool _isButtonEnabled = false;
  bool get isButtonEnabled => _isButtonEnabled;

  void _updateButton (){
    _isButtonEnabled = _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    notifyListeners();
  }

  void initController(){
    _usernameController.addListener(_updateButton);
    _passwordController.addListener(_updateButton);
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }
}