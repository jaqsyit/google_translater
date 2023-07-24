import 'package:hive/hive.dart';

part 'favorites_util.g.dart';

@HiveType(typeId: 0)
class Favorites {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String originalText;

  @HiveField(2)
  final String translatedText;

  Favorites(this.id, this.originalText, this.translatedText);
}

void saveToFavorites(String originalText, String translatedText) async {
  final box = Hive.box<Favorites>('Favorites');

  // Check if the entry with the same originalText and translatedText exists
  final existingFavorite = box.values.firstWhere(
    (favorite) =>
        favorite.originalText == originalText &&
        favorite.translatedText == translatedText,
    orElse: () =>
        Favorites('', '', ''), // Return an empty instance if not found
  );

  // If the entry does not exist, add a new one to favorites
  if (existingFavorite.id.isEmpty) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final favorite = Favorites(id, originalText, translatedText);
    await box.put(id, favorite);
  }
}
