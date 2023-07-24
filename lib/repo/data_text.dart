// To parse this JSON data, do
//
//     final translite = transliteFromJson(jsonString);

import 'dart:convert';

Translite transliteFromJson(String str) => Translite.fromJson(json.decode(str));

String transliteToJson(Translite data) => json.encode(data.toJson());

class Translite {
  Data data;

  Translite({
    required this.data,
  });

  factory Translite.fromJson(Map<String, dynamic> json) => Translite(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<Translation> translations;

  Data({
    required this.translations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
      };
}

class Translation {
  String translatedText;

  Translation({
    required this.translatedText,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translatedText: json["translatedText"],
      );

  Map<String, dynamic> toJson() => {
        "translatedText": translatedText,
      };
}
