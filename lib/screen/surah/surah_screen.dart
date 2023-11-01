import 'package:al_quran_app/screen/splash/splash_screen.dart';
import 'package:al_quran_app/screen/surah/component/list_juz_component.dart';
import 'package:al_quran_app/screen/surah/component/list_surah_component.dart';
import 'package:al_quran_app/screen/surah/view_model/juz_view_model.dart';
import 'package:al_quran_app/screen/surah/view_model/surah_view_model.dart';
import 'package:al_quran_app/utils/shared_preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SurahScreen extends StatelessWidget {
  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<JuzViewModel>(context, listen: false).getJuzList();
    Provider.of<SurahViewModel>(context, listen: false).getSurahList();
    Provider.of<SurahViewModel>(context, listen: false).initial();
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffedf2fa),
        appBar: AppBar(
          title: Text(
            'Al-Quran',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xffb8e0d4),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashScreen()),
                  (route) => false,
                );
                await SharedPreferencesUtils().removeToken();
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Consumer<SurahViewModel>(
          builder: (context, surahViewModel, child) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assalamualaikum',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
                  Text(
                    surahViewModel.username ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TabBar(
                    tabs: <Widget>[
                      Tab(
                        child: Text(
                          'List Surah',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'List Juz',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        ListSurahComponent(),
                        ListJuzComponent(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
