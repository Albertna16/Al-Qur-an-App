class SurahLocalModels {
  int? id;
  String? nameSimple;
  String? nameArabic;
  String? revelationPlace;
  int? versesCount;

  SurahLocalModels({
    this.id,
    this.nameSimple,
    this.nameArabic,
    this.revelationPlace,
    this.versesCount,
  });

  SurahLocalModels.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    nameSimple = map['nameSimple'];
    nameArabic = map['nameArabic'];
    revelationPlace = map['revelationPlace'];
    versesCount = map['versesCount'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameSimple": nameSimple,
        "nameArabic": nameArabic,
        "revelationPlace": revelationPlace,
        "versesCount": versesCount,
      };
}