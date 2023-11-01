import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:al_quran_app/screen/detail_surah/detail_surah_screen.dart';
import 'package:al_quran_app/screen/surah/view_model/surah_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListSurahComponent extends StatelessWidget {
  const ListSurahComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SurahViewModel>(
      builder: (context, surahViewModel, child) {
        final surahList = surahViewModel.surahList;
        return surahList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: ListView.builder(
                  itemCount: surahList.chapters?.length,
                  itemBuilder: (context, index) {
                    final surah = surahList.chapters?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailSurahScreen(
                              idSurah: surah.id ?? 0,
                              nameSurah: surah.nameSimple,
                              surahLocalModels: SurahLocalModels(
                                id: surah.id,
                                nameArabic: surah.nameArabic,
                                nameSimple: surah.nameSimple,
                                revelationPlace: surah.revelationPlace,
                                versesCount: surah.versesCount,
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
                            child: Text(surah!.id.toString()),
                          ),
                          title: Text(surah.nameSimple ?? ''),
                          subtitle: Text(
                              '${surah.revelationPlace} | ${surah.versesCount} ayat'),
                          trailing: Text(
                            surah.nameArabic ?? '',
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
      },
    );
  }
}
