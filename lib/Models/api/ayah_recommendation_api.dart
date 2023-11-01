import 'dart:convert';
import 'package:al_quran_app/Models/openai_models.dart';
import 'package:al_quran_app/constant/open_ai.dart';
import 'package:http/http.dart' as http;

class AyahRecommendationAPI {
  Future<OpenAiModels> getRecommendationAyah({
    required String yourCondition,
  }) async {
    late OpenAiModels openAiModels = OpenAiModels(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
      ),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/completions');
      Map<String, String> headers = {
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8',
        'Authorization': 'Bearer $apiKey'
      };

      String promptData =
          "Berikan saya 1 rekomendasi ayat Al-Quran dengan menyebutkan ayatnya keberapa dan surat apa tentang kondisi saya yaitu $yourCondition";
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": promptData,
        "temperature": 0.4,
        "max_tokens": 256,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      });

      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        openAiModels = openAiModelsFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengirim permintaan');
    }

    return openAiModels;
  }
}