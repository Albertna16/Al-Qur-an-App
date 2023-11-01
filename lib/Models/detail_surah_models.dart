import 'dart:convert';

DetailSurahModels detailSurahAyahArabModelsFromJson(String str) => DetailSurahModels.fromJson(json.decode(str));

String detailSurahAyahArabModelsToJson(DetailSurahModels data) => json.encode(data.toJson());

class DetailSurahModels {
    List<Verse>? verses;
    Meta? meta;

    DetailSurahModels({
        this.verses,
        this.meta,
    });

    factory DetailSurahModels.fromJson(Map<String, dynamic> json) => DetailSurahModels(
        verses: json["verses"] == null ? [] : List<Verse>.from(json["verses"]!.map((x) => Verse.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "verses": verses == null ? [] : List<dynamic>.from(verses!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
    };
}

class Meta {
    Filters? filters;

    Meta({
        this.filters,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
    );

    Map<String, dynamic> toJson() => {
        "filters": filters?.toJson(),
    };
}

class Filters {
    String? chapterNumber;

    Filters({
        this.chapterNumber,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        chapterNumber: json["chapter_number"],
    );

    Map<String, dynamic> toJson() => {
        "chapter_number": chapterNumber,
    };
}

class Verse {
    int? id;
    String? verseKey;
    String? textImlaei;

    Verse({
        this.id,
        this.verseKey,
        this.textImlaei,
    });

    factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        verseKey: json["verse_key"],
        textImlaei: json["text_imlaei"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "verse_key": verseKey,
        "text_imlaei": textImlaei,
    };
}
