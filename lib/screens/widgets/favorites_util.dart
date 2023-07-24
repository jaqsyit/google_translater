/* favorites_util.dart
/
/ Этот файл содержит определение класса Favorites, который используется
/ для представления избранных переводов, и функции saveToFavorites, которая
/ служит для сохранения перевода в избранные.
/
/ Favorites - класс для представления избранного перевода. Он использует Hive
/ аннотации (@HiveType и @HiveField) для сериализации и десериализации объектов
/ этого класса в Hive Box.
/
/ saveToFavorites - функция для сохранения перевода в избранные. Она принимает два
/ аргумента: originalText (текст оригинала) и translatedText (переведенный текст).
/ Функция проверяет, есть ли уже запись с такими же originalText и translatedText
/ в Hive Box 'Favorites'. Если запись не существует, она создает новый объект Favorites
/ с уникальным идентификатором и сохраняет его в Hive Box.
*/

import 'package:hive/hive.dart';

// Генерируемый код для сериализации/десериализации объектов Favorites
part 'favorites_util.g.dart';

/// Класс Favorites - представление избранного перевода.
/// Использует аннотации Hive (@HiveType и @HiveField) для сериализации и десериализации
/// объектов этого класса в Hive Box.
@HiveType(typeId: 0)
class Favorites {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String originalText;

  @HiveField(2)
  final String translatedText;

  /// Конструктор класса Favorites
  Favorites(this.id, this.originalText, this.translatedText);
}

/* Функция saveToFavorites - сохраняет перевод в избранные.
/ Принимает два аргумента: originalText (текст оригинала) и translatedText (переведенный текст).
/ Функция проверяет, есть ли уже запись с такими же originalText и translatedText
/ в Hive Box 'Favorites'. Если запись не существует, она создает новый объект Favorites
/ с уникальным идентификатором и сохраняет его в Hive Box.
/
/ Пример использования:
/ ```dart
/ saveToFavorites("Hello", "Привет");
/ ```
/ В этом примере текст "Hello" будет сохранен как оригинальный текст,
/ а "Привет" - как его перевод в избранные.
/ Если такой перевод уже существует в избранных, он не будет повторно сохранен.
*/
void saveToFavorites(String originalText, String translatedText) async {
  final box = Hive.box<Favorites>('Favorites');

  // Проверяем, существует ли запись с такими же originalText и translatedText
  final existingFavorite = box.values.firstWhere(
    (favorite) =>
        favorite.originalText == originalText &&
        favorite.translatedText == translatedText,
    orElse: () => Favorites(
        '', '', ''), // Возвращаем пустой экземпляр, если запись не найдена
  );

  // Если запись не существует, добавляем новую запись в избранные
  if (existingFavorite.id.isEmpty) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final favorite = Favorites(id, originalText, translatedText);
    await box.put(id, favorite);
  }
}
