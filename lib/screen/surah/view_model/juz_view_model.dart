import 'package:al_quran_app/Models/api/juz_api.dart';
import 'package:al_quran_app/Models/juz_models.dart';
import 'package:flutter/foundation.dart';

class JuzViewModel extends ChangeNotifier {
  final JuzAPI _juzAPI = JuzAPI();
  JuzModels? _juzList;

  JuzModels? get juzList => _juzList;

  Future<void> getJuzList() async {
    try {
      _juzList = await _juzAPI.getListJuz();
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}