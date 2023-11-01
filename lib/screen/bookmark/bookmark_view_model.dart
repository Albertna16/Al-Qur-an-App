import 'dart:async';
import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:al_quran_app/helper/database_helper.dart';
import 'package:flutter/foundation.dart';

class BookmarkViewModel extends ChangeNotifier {
  List<SurahLocalModels> _surahLocalModels = [];
  List<SurahLocalModels> get surahLocalModels => _surahLocalModels;

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  final StreamController<List<SurahLocalModels>> _surahStreamController =
      StreamController<List<SurahLocalModels>>();

  Stream<List<SurahLocalModels>> get surahStream =>
      _surahStreamController.stream;

  Future<void> getSurahLocal() async {
    _surahLocalModels = await _databaseHelper.getListSurah();
    _surahStreamController.add(_surahLocalModels);
    notifyListeners();
  }
}
