/*
  FavoritesScreen - Экран отображения избранных переводов

  Этот экран отображает список избранных переводов, сохраненных в Hive, с использованием
  пакета hive и hive_flutter для работы с базой данных локального хранилища.

  Импорт пакетов:
  - flutter/material.dart: Библиотека для создания пользовательского интерфейса.
  - hive/hive.dart: Пакет для работы с Hive - легковесной базой данных локального хранилища.
  - hive_flutter/hive_flutter.dart: Пакет для поддержки Hive в Flutter приложениях.
  - translater/screens/widgets/favorites_util.dart: Импорт класса Favorites, определенного в другом файле.

  Класс FavoritesScreen - StatelessWidget, который отображает список избранных переводов.

  Метод build:
  - Возвращает Scaffold, который содержит AppBar с заголовком "Избранные переводы" и тело с виджетом ValueListenableBuilder.
  - В ValueListenableBuilder происходит прослушивание изменений в Hive Box с избранными переводами.
  - При изменении данных в Box, строится список ListTile, отображающий каждый избранный перевод.

  Замечания:
  - Для правильной работы экрана, убедитесь, что у вас настроены и работают пакеты hive и hive_flutter.
  - Для сохранения переводов в избранное, используйте утилиту FavoritesUtil или схожие методы.
*/

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
        title: Text(S.of(context).favoriteScreenTitle), // Заголовок AppBar
      ),
      body: ValueListenableBuilder<Box<Favorites>>(
        valueListenable: Hive.box<Favorites>('Favorites')
            .listenable(), // Прослушивание изменений в Hive Box с избранными переводами
        builder: (context, box, _) {
          final favoritesList = box.values
              .toList()
              .cast<Favorites>(); // Преобразование избранных переводов в список
          if (favoritesList.isEmpty) {
            // Если список избранных пуст
            return Center(
              child: Text(S
                  .of(context)
                  .favoriteListEmpty), // Вывод сообщения о пустом списке
            );
          } else {
            // Если список избранных не пуст
            return ListView.builder(
              itemCount: favoritesList
                  .length, // Количество элементов в списке избранных переводов
              itemBuilder: (context, index) {
                final favorite = favoritesList[
                    index]; // Получение избранного перевода по индексу
                return ListTile(
                  // Вывод ListTile для каждого избранного перевода
                  title: Text(favorite
                      .originalText), // Отображение оригинального текста
                  subtitle: Text(favorite
                      .translatedText), // Отображение переведенного текста
                );
              },
            );
          }
        },
      ),
    );
  }
}
