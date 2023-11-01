import 'package:al_quran_app/Models/api/audio_surah_api.dart';
import 'package:al_quran_app/Models/audio_surah_models.dart';
import 'package:flutter/foundation.dart';

class AudioSurahViewModel extends ChangeNotifier {
  final AudioSurahAPI _audioSurahAPI = AudioSurahAPI();

  AudioSurahModels? _audioSurahList;
  AudioSurahModels? get audioSurahList => _audioSurahList;

  Future<void> getAudioSurahList({required int idSurah}) async {
    try {
      _audioSurahList = await _audioSurahAPI.getAudioSurah(idSurah: idSurah);
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}
