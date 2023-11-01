import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:al_quran_app/screen/detail_surah/detail_surah_screen.dart';
import 'package:al_quran_app/screen/surah/view_model/juz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListJuzComponent extends StatelessWidget {
  const ListJuzComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JuzViewModel>(
      builder: (context, juzModels, child) {
        final juzList = juzModels.juzList;
        return juzList == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                child: ListView.builder(
                  itemCount: juzList.juzs?.length,
                  itemBuilder: (context, index) {
                    final juz = juzList.juzs?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailSurahScreen(
                              juzNumber: juz.juzNumber,
                              surahLocalModels: SurahLocalModels(
                                id: juz.id,
                                versesCount: juz.versesCount
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
                            child: Text(juz!.id.toString()),
                          ),
                          title: Text('Juz ${juz.id}'),
                          subtitle: Text('${juz.versesCount} ayat'),
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
