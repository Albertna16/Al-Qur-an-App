import 'package:al_quran_app/Models/juz_models.dart';
import 'package:dio/dio.dart';

class JuzAPI {
  final String apiJuz = "https://api.quran.com/api/v4/juzs";

  Future<JuzModels> getListJuz() async {
    try {
      Response response = await Dio().get(apiJuz);

      if (response.statusCode == 200) {
        return JuzModels.fromJson(response.data);
      } else {
        throw Exception('Failed to load Juz list');
      }
    } catch (error) {
      throw Exception('Failed to load Juz list: $error');
    }
  }
}