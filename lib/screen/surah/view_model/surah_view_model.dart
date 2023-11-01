import 'package:al_quran_app/Models/api/surah_api.dart';
import 'package:al_quran_app/Models/surah_models.dart';
import 'package:al_quran_app/utils/shared_preferences_utils.dart';
import 'package:flutter/foundation.dart';

class SurahViewModel extends ChangeNotifier {
  final SurahAPI _surahAPI = SurahAPI();
  
  SurahModels? _surahList;
  SurahModels? get surahList => _surahList;

  String? _username;
  String? get username => _username; 

  void initial() async {
    _username = await SharedPreferencesUtils().getToken();
    notifyListeners();
  }

  Future<void> getSurahList() async {
    try {
      _surahList = await _surahAPI.getListSurah();
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
}