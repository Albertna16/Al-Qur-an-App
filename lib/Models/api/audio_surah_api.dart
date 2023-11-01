import 'package:al_quran_app/Models/audio_surah_models.dart';
import 'package:dio/dio.dart';

class AudioSurahAPI {
  Future<AudioSurahModels> getAudioSurah({required int idSurah}) async {
    final String apiAudioSurah = "https://api.quran.com/api/v4/chapter_recitations/2/$idSurah";
    try {
      Response response = await Dio().get(apiAudioSurah);

      if (response.statusCode == 200) {
        return AudioSurahModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Audio Surah');
      }
    } catch (error) {
      throw Exception('Failed to load Audio Surah: $error');
    }
  }
}