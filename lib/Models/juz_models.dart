// import 'dart:convert';

// JuzModels juzModelsFromJson(String str) => JuzModels.fromJson(json.decode(str));

// String juzModelsToJson(JuzModels data) => json.encode(data.toJson());

class JuzModels {
    List<Juz>? juzs;

    JuzModels({
        this.juzs,
    });

    factory JuzModels.fromJson(Map<String, dynamic> json) => JuzModels(
        juzs: json["juzs"] == null ? [] : List<Juz>.from(json["juzs"]!.map((x) => Juz.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "juzs": juzs == null ? [] : List<dynamic>.from(juzs!.map((x) => x.toJson())),
    };
}

class Juz {
    int? id;
    int? juzNumber;
    Map<String, String>? verseMapping;
    int? firstVerseId;
    int? lastVerseId;
    int? versesCount;

    Juz({
        this.id,
        this.juzNumber,
        this.verseMapping,
        this.firstVerseId,
        this.lastVerseId,
        this.versesCount,
    });

    factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        id: json["id"],
        juzNumber: json["juz_number"],
        verseMapping: Map.from(json["verse_mapping"]!).map((k, v) => MapEntry<String, String>(k, v)),
        firstVerseId: json["first_verse_id"],
        lastVerseId: json["last_verse_id"],
        versesCount: json["verses_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "juz_number": juzNumber,
        "verse_mapping": Map.from(verseMapping!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "first_verse_id": firstVerseId,
        "last_verse_id": lastVerseId,
        "verses_count": versesCount,
    };
}
