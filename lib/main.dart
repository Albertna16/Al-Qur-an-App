import 'package:al_quran_app/screen/ayah_openai/ayah_openai_view_model.dart';
import 'package:al_quran_app/screen/bookmark/bookmark_view_model.dart';
import 'package:al_quran_app/screen/detail_surah/detail_surah_view_model.dart';
import 'package:al_quran_app/screen/login/login_view_model.dart';
import 'package:al_quran_app/screen/splash/splash_screen.dart';
import 'package:al_quran_app/screen/splash/splash_view_model.dart';
import 'package:al_quran_app/screen/surah/view_model/audio_surah_view_model.dart';
import 'package:al_quran_app/screen/surah/view_model/juz_view_model.dart';
import 'package:al_quran_app/screen/surah/view_model/surah_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SurahViewModel>(
          create: (context) => SurahViewModel(),
        ),
        ChangeNotifierProvider<DetailSurahViewModel>(
          create: (context) => DetailSurahViewModel(),
        ),
        ChangeNotifierProvider<JuzViewModel>(
          create: (context) => JuzViewModel(),
        ),
        ChangeNotifierProvider<AyahOpenAiVieModel>(
          create: (context) => AyahOpenAiVieModel(),
        ),
        ChangeNotifierProvider<SplashViewModel>(
          create: (context) => SplashViewModel(),
        ),
        ChangeNotifierProvider<AudioSurahViewModel>(
          create: (context) => AudioSurahViewModel(),
        ),
        ChangeNotifierProvider<BookmarkViewModel>(
          create: (context) => BookmarkViewModel(),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Al-Quran',
        home: SplashScreen(),
      ),
    );
  }
}
