import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:al_quran_app/Models/api/ayah_recommendation_api.dart';
import 'package:al_quran_app/Models/openai_models.dart';

class AyahOpenAiVieModel extends ChangeNotifier {
  final TextEditingController _conditionController = TextEditingController();
  TextEditingController get conditionController => _conditionController;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _showResult = false;
  bool get showResult => _showResult;

  OpenAiModels? _gptResponseData;
  OpenAiModels? get gptResponseData => _gptResponseData;

  bool isButtonEnabled = false;

  void _updateButtonState() {
    isButtonEnabled = _conditionController.text.isNotEmpty;
  }

  void buttonListener() {
    _conditionController.addListener(_updateButtonState);
  }

  Future<void> getRecommendationAyah() async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await AyahRecommendationAPI().getRecommendationAyah(
        yourCondition: conditionController.text,
      );

      _gptResponseData = result;
      _showResult = true;

      conditionController.clear();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
