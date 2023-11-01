import 'package:al_quran_app/Models/translation_surah_models.dart';
import 'package:dio/dio.dart';

class TranslationSurahAPI {
  Future<TranslationSurahModels> getTranslationSurah({required int idSurah}) async {
    final String apiTranslationSurah = "https://api.quran.com/api/v4/quran/translations/167?chapter_number=$idSurah";
    try {
      Response response = await Dio().get(apiTranslationSurah);

      if (response.statusCode == 200) {
        return TranslationSurahModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Translation Surah list');
      }
    } catch (error) {
      throw Exception('Failed to load Translation Surah list: $error');
    }
  }

  Future<TranslationSurahModels> getTranslationJuz({required int juzNumber}) async {
    final String apiTranslationJuz = "https://api.quran.com/api/v4/quran/translations/167?juz_number=$juzNumber";
    try {
      Response response = await Dio().get(apiTranslationJuz);

      if (response.statusCode == 200) {
        return TranslationSurahModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Translation Juz list');
      }
    } catch (error) {
      throw Exception('Failed to load Translation Juz list: $error');
    }
  }
}
