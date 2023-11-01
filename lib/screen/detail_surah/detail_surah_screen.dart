import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:al_quran_app/screen/detail_surah/detail_surah_view_model.dart';
import 'package:al_quran_app/screen/surah/view_model/audio_surah_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailSurahScreen extends StatelessWidget {
  final int? idSurah;
  final int? juzNumber;
  final String? nameSurah;
  final SurahLocalModels surahLocalModels;
  const DetailSurahScreen({
    super.key,
    this.idSurah,
    this.juzNumber,
    this.nameSurah,
    required this.surahLocalModels,
  });

  @override
  Widget build(BuildContext context) {
    if (juzNumber == null) {
      Provider.of<DetailSurahViewModel>(context, listen: false).getDetailSurah(
        idSurah: idSurah ?? -1,
      );
      Provider.of<DetailSurahViewModel>(context, listen: false)
          .getTranslationSurah(
        idSurah: idSurah ?? -1,
      );
      Provider.of<AudioSurahViewModel>(context, listen: false)
          .getAudioSurahList(
        idSurah: idSurah ?? -1,
      );
    } else {
      Provider.of<DetailSurahViewModel>(context, listen: false).getDetailJuz(
        juzNumber: juzNumber ?? -1,
      );
      Provider.of<DetailSurahViewModel>(context, listen: false)
          .getTranslationJuz(
        juzNumber: juzNumber ?? -1,
      );
    }

    Provider.of<DetailSurahViewModel>(context, listen: false).getSurahById(
      idSurah ?? -1,
    );

    return Scaffold(
      backgroundColor: const Color(0xffedf2fa),
      appBar: AppBar(
        title: Text(
          juzNumber == null ? nameSurah ?? '' : 'Juz $juzNumber',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffb8e0d4),
        actions: [
          Consumer<DetailSurahViewModel>(
            builder: ((context, detailSurahViewModel, child) {
              return Visibility(
                visible: juzNumber == null,
                child: IconButton(
                  onPressed: () {
                    if (detailSurahViewModel.surahLocalModels?.id ==
                        surahLocalModels.id) {
                      detailSurahViewModel.deleteSurah();
                    } else {
                      detailSurahViewModel.insertSurah(
                        idSurah: idSurah ?? -1,
                        surahLocalModels: surahLocalModels,
                      );
                    }
                  },
                  icon: detailSurahViewModel.surahLocalModels?.id ==
                          surahLocalModels.id
                      ? const Icon(
                          Icons.bookmark,
                        )
                      : const Icon(
                          Icons.bookmark_border,
                        ),
                ),
              );
            }),
          ),
          Consumer<DetailSurahViewModel>(
              builder: (context, detailSurahViewModel, child) {
            return Visibility(
              visible: juzNumber == null,
              child: IconButton(
                onPressed: () {
                  if (detailSurahViewModel.isAudioPlay == true) {
                    detailSurahViewModel.pauseAudioSurah();
                  } else {
                    detailSurahViewModel.playAudioSurah(idSurah ?? -1);
                  }
                },
                icon: Icon(
                  detailSurahViewModel.isAudioPlay
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
              ),
            );
          })
        ],
      ),
      body: Consumer<DetailSurahViewModel>(
          builder: (context, detailSurahViewModel, child) {
        final detailSurah = detailSurahViewModel.detailSurah;
        return detailSurah == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: detailSurahViewModel.detailSurah?.verses?.length,
                itemBuilder: ((context, index) {
                  final detailSurah =
                      detailSurahViewModel.detailSurah?.verses?[index];
                  final translationSurah = detailSurahViewModel
                      .translationSurah?.translations?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            detailSurah?.textImlaei ?? '',
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.justify,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            (index + 1).toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            translationSurah?.text ?? '',
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                }),
              );
      }),
    );
  }
}
