import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:translater/generated/l10n.dart';
import 'package:translater/screens/widgets/favorites_util.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favoriteScreenTitle),
      ),
      body: ValueListenableBuilder<Box<Favorites>>(
        valueListenable: Hive.box<Favorites>('Favorites').listenable(),
        builder: (context, box, _) {
          final favoritesList = box.values.toList().cast<Favorites>();
          if (favoritesList.isEmpty) {
            return Center(
              child: Text(S.of(context).favoriteListEmpty),
            );
          } else {
            return ListView.builder(
              itemCount: favoritesList.length,
              itemBuilder: (context, index) {
                final favorite = favoritesList[index];
                return ListTile(
                  title: Text(favorite.originalText),
                  subtitle: Text(favorite.translatedText),
                  trailing: IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteFromFavorites(box, index);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _deleteFromFavorites(Box<Favorites> box, int index) {
    // Удаление избранного перевода из Hive Box по индексу
    box.deleteAt(index);
  }
}
