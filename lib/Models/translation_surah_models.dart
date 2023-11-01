// To parse this JSON data, do
//
//     final translationSurahModels = translationSurahModelsFromJson(jsonString);

import 'dart:convert';

TranslationSurahModels translationSurahModelsFromJson(String str) => TranslationSurahModels.fromJson(json.decode(str));

String translationSurahModelsToJson(TranslationSurahModels data) => json.encode(data.toJson());

class TranslationSurahModels {
    List<Translation>? translations;
    Meta? meta;

    TranslationSurahModels({
        this.translations,
        this.meta,
    });

    factory TranslationSurahModels.fromJson(Map<String, dynamic> json) => TranslationSurahModels(
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
    };
}

class Meta {
    String? translationName;
    String? authorName;
    Filters? filters;

    Meta({
        this.translationName,
        this.authorName,
        this.filters,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        translationName: json["translation_name"],
        authorName: json["author_name"],
        filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
    );

    Map<String, dynamic> toJson() => {
        "translation_name": translationName,
        "author_name": authorName,
        "filters": filters?.toJson(),
    };
}

class Filters {
    int? resourceId;
    String? chapterNumber;

    Filters({
        this.resourceId,
        this.chapterNumber,
    });

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        resourceId: json["resource_id"],
        chapterNumber: json["chapter_number"],
    );

    Map<String, dynamic> toJson() => {
        "resource_id": resourceId,
        "chapter_number": chapterNumber,
    };
}

class Translation {
    int? resourceId;
    String? text;

    Translation({
        this.resourceId,
        this.text,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        resourceId: json["resource_id"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "resource_id": resourceId,
        "text": text,
    };
}
