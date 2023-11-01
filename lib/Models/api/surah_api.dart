import 'package:al_quran_app/Models/surah_models.dart';
import 'package:dio/dio.dart';

class SurahAPI {
  final String apiSurah = "https://api.quran.com/api/v4/chapters?language=id";

  Future<SurahModels> getListSurah() async {
    try {
      Response response = await Dio().get(apiSurah);

      if (response.statusCode == 200) {
        return SurahModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Surah list');
      }
    } catch (error) {
      throw Exception('Failed to load Surah list: $error');
    }
  }
}