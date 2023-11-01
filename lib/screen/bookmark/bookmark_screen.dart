import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:al_quran_app/screen/bookmark/bookmark_view_model.dart';
import 'package:al_quran_app/screen/detail_surah/detail_surah_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<BookmarkViewModel>(context, listen: false).getSurahLocal();
    return Scaffold(
      backgroundColor: const Color(0xffedf2fa),
      appBar: AppBar(
        title: Text(
          'Bookmark Surah',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xffb8e0d4),
        centerTitle: true,
      ),
      body: StreamBuilder<List<SurahLocalModels>>(
        stream: Provider.of<BookmarkViewModel>(context).surahStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final surahLocalModels = snapshot.data ?? [];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: surahLocalModels.isEmpty
                  ? Center(
                      child: Text(
                        'Belum terdapat bookmark surah',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: surahLocalModels.length,
                      itemBuilder: (context, int index) {
                        var surahData = surahLocalModels[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailSurahScreen(
                                  idSurah: surahData.id ?? 0,
                                  nameSurah: surahData.nameSimple,
                                  surahLocalModels: SurahLocalModels(
                                    id: surahData.id,
                                    nameArabic: surahData.nameArabic,
                                    nameSimple: surahData.nameSimple,
                                    revelationPlace: surahData.revelationPlace,
                                    versesCount: surahData.versesCount,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              bottom: 12,
                              left: 8,
                              right: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 0.5,
                                color: Colors.grey,
                              ),
                            ),
                            child: ListTile(
                              leading: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffb8e0d4),
                                ),
                                child: Text(surahData.id.toString()),
                              ),
                              title: Text(surahData.nameSimple ?? ''),
                              subtitle: Text(
                                  '${surahData.revelationPlace} | ${surahData.versesCount} ayat'),
                              trailing: Text(
                                surahData.nameArabic ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            );
          }
        },
      ),
    );
  }
}
