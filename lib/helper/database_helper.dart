import 'package:al_quran_app/Models/surah_local_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  String surahTable = 'surahTable';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(
        await getDatabasesPath(),
        'surah_db.db',
      ),
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $surahTable(
          id INTEGER PRIMARY KEY,
          nameSimple TEXT,
          nameArabic TEXT,
          revelationPlace TEXT,
          versesCount INTEGER
        )''');
      },
      version: 1,
    );

    return db;
  }

  // Insert surah
  Future<void> insertSurah(SurahLocalModels surahLocalModels) async {
    final db = await database;
    await db.insert(surahTable, surahLocalModels.toJson());
  }

  // Delete surah
  Future<void> deleteSurah(int id) async {
    final db = await database;
    await db.delete(surahTable, where: "id = ?", whereArgs: [id]);
  }

  // Get id surah
  Future<SurahLocalModels> getSurahById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      surahTable,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return result.map((e) => SurahLocalModels.fromJson(e)).toList().first;
    } else {
      return SurahLocalModels();
    }
  }

  Future<List<SurahLocalModels>> getListSurah() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query(
      surahTable,
    );

    return result.map((e) => SurahLocalModels.fromJson(e)).toList();
  }
}