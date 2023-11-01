import 'package:al_quran_app/Models/api/detail_surah_api.dart';
import 'package:al_quran_app/Models/api/translation_surah_api.dart';
import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:al_quran_app/Models/translation_surah_models.dart';
import 'package:al_quran_app/helper/database_helper.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:al_quran_app/Models/detail_surah_models.dart';

class DetailSurahViewModel extends ChangeNotifier {
  final DetailSurahAPI _detailSurahAPI = DetailSurahAPI();
  DetailSurahModels? _detailSurah;
  DetailSurahModels? get detailSurah => _detailSurah;

  final TranslationSurahAPI _translationSurahAPI = TranslationSurahAPI();
  TranslationSurahModels? _translationSurah;
  TranslationSurahModels? get translationSurah => _translationSurah;

  final _audioPlayer = AudioPlayer();
  bool _isAudioPlay = false;
  bool get isAudioPlay => _isAudioPlay;

  final DatabaseHelper _dbHelper = DatabaseHelper();
  DatabaseHelper get dbHelper => _dbHelper;

  SurahLocalModels? _surahLocalModels;
  SurahLocalModels? get surahLocalModels => _surahLocalModels;

  void getSurahById(int id) async {
    _surahLocalModels = await dbHelper.getSurahById(id);
    notifyListeners();
  }

  void insertSurah({
    required int idSurah,
    required SurahLocalModels surahLocalModels,
  }) async {
    await _dbHelper.insertSurah(surahLocalModels);
    getSurahById(idSurah);
    notifyListeners();
  }

  void deleteSurah() async {
    await _dbHelper.deleteSurah(surahLocalModels?.id?.toInt() ?? 0);
    _surahLocalModels = null;
    notifyListeners();
  }

  Future<void> getDetailSurah({required int idSurah}) async {
    try {
      _detailSurah = await _detailSurahAPI.getDetailSurah(idSurah: idSurah);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> getDetailJuz({required int juzNumber}) async {
    try {
      _detailSurah = await _detailSurahAPI.getDetailJuz(juzNumber: juzNumber);
      notifyListeners();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> getTranslationSurah({required int idSurah}) async {
    try {
      _translationSurah =
          await _translationSurahAPI.getTranslationSurah(idSurah: idSurah);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  Future<void> getTranslationJuz({required int juzNumber}) async {
    try {
      _translationSurah =
          await _translationSurahAPI.getTranslationJuz(juzNumber: juzNumber);
      notifyListeners();
    } catch (error) {
      throw Exception(error);
    }
  }

  void playAudioSurah(int idSurah) async {
    await _audioPlayer.play(
      UrlSource(
        "https://download.quranicaudio.com/qdc/abdul_baset/murattal/$idSurah.mp3",
      ),
    );
    _isAudioPlay = true;
    notifyListeners();
  }

  void pauseAudioSurah() async {
    await _audioPlayer.pause();
    _isAudioPlay = false;
    notifyListeners();
  }
}
