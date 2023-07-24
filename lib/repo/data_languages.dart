// To parse this JSON data, do
//
//     final parseLanguages = parseLanguagesFromJson(jsonString);

import 'dart:convert';

ParseLanguages parseLanguagesFromJson(String str) =>
    ParseLanguages.fromJson(json.decode(str));

String parseLanguagesToJson(ParseLanguages data) => json.encode(data.toJson());

class ParseLanguages {
  Data data;

  ParseLanguages({
    required this.data,
  });

  factory ParseLanguages.fromJson(Map<String, dynamic> json) => ParseLanguages(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Language> languages;

  Data({
    required this.languages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
      };

  // Метод для получения списка строк с языками
  List<String> getLanguageStrings() {
    return languages.map((language) => language.language).toList();
  }
}

class Language {
  String language;

  Language({
    required this.language,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "language": language,
      };
}
