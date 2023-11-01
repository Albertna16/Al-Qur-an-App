import 'package:al_quran_app/Models/detail_surah_models.dart';
import 'package:dio/dio.dart';

class DetailSurahAPI {
  Future<DetailSurahModels> getDetailSurah({required int idSurah}) async {
    final String apiDetailSurah = "https://api.quran.com/api/v4/quran/verses/imlaei?chapter_number=$idSurah";
    try {
      Response response = await Dio().get(apiDetailSurah);

      if (response.statusCode == 200) {
        return DetailSurahModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Surah list');
      }
    } catch (error) {
      throw Exception('Failed to load Surah list: $error');
    }
  }

  Future<DetailSurahModels> getDetailJuz({required int juzNumber}) async {
    final String apiDetailJuz = "https://api.quran.com/api/v4/quran/verses/imlaei?juz_number=$juzNumber";
    try {
      Response response = await Dio().get(apiDetailJuz);

      if (response.statusCode == 200) {
        return DetailSurahModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Surah list');
      }
    } catch (error) {
      throw Exception('Failed to load Surah list: $error');
    }
  }
}
