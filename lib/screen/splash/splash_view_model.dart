import 'dart:async';
import 'package:al_quran_app/screen/home/home_screen.dart';
import 'package:al_quran_app/screen/login/login_screen.dart';
import 'package:al_quran_app/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> checkLogin(BuildContext context) async {
    final user = await SharedPreferencesUtils().getToken();
    if (user.isNotEmpty) {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false,
          );
        },
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        },
      );
    }
  }
}
