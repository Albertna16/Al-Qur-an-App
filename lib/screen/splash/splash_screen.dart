import 'dart:async';
import 'package:al_quran_app/screen/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Provider.of<SplashViewModel>(context, listen: false).checkLogin(context);
    });

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color(0xffedf2fa),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/image/Al-Quran.png'),
          const SizedBox(
            height: 6,
          ),
          Text(
            "Al-Qur'an App",
            style: GoogleFonts.mooli(
              fontSize: 30,
              color: Colors.black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
