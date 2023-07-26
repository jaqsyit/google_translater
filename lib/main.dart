// Импорт пакетов и файлов приложения
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:translater/constants/app_styles.dart'; // Импорт стилей приложения
import 'package:translater/repo/repo_settings.dart'; // Импорт класса для работы с настройками приложения
import 'package:translater/screens/home_page.dart'; // Импорт домашней страницы приложения
import 'package:translater/screens/widgets/favorites_util.dart';
import 'package:translater/widgets/init_widgets.dart'; // Импорт виджета инициализации приложения
import 'constants/app_colors.dart'; // Импорт цветов приложения
import 'generated/l10n.dart'; // Импорт локализации

import 'package:path_provider/path_provider.dart' as path_provider;

// Функция main - точка входа в приложение
Future<void> main() async {
  // Инициализация Flutter приложения
  WidgetsFlutterBinding.ensureInitialized();

  // Установка стиля для системной панели (статус-бара)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
  );

  // Инициализация класса для работы с настройками приложения
  final repoSettings = RepoSettings();
  await repoSettings.init();

  final applicatonDocumentDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(applicatonDocumentDir.path);
  Hive.registerAdapter(FavoritesAdapter());
  await Hive.openBox<Favorites>('Favorites');

  // Установка локали приложения
  var defaultLocale =
      const Locale('ru', 'RU'); // Локаль по умолчанию - русский язык
  final locale = await repoSettings
      .readLocale(); // Получение сохраненной локали из настроек
  if (locale == 'en') {
    defaultLocale = const Locale(
        'en'); // Если локаль - английский, установить английскую локаль
  }

  // Запуск главного виджета приложения (TranslatorApp) с установленной локалью
  runApp(
    TranslatorApp(locale: defaultLocale),
  );
}

// Класс TranslatorApp - главный виджет приложения
class TranslatorApp extends StatelessWidget {
  const TranslatorApp({
    Key? key,
    required this.locale,
  }) : super(key: key);

  final Locale locale;

  @override
  Widget build(BuildContext context) {
    // Вывод в консоль текущей локали приложения (используется для проверки)
    print("locale: $locale");

    // Возвращаем виджет InitWidget для обеспечения инициализации приложения
    return InitWidget(
      // AdaptiveTheme - виджет для работы с адаптивной темой приложения (светлая и темная темы)
      child: AdaptiveTheme(
        // Конфигурация светлой темы
        light: ThemeData(
          brightness: Brightness.light, // Яркость светлой темы
          primarySwatch: AppColors.customColor, // Основной цвет приложения
        ),
        // Конфигурация темной темы
        dark: ThemeData(
          brightness: Brightness.dark, // Яркость темной темы
          primarySwatch: AppColors.customColor, // Основной цвет приложения
        ),
        // Инициализация адаптивной темы на основе системных настроек
        initial:
            AdaptiveThemeMode.light, // По умолчанию используется светлая тема
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner:
              false, // Отключение баннера с надписью "Debug"
          title: 'Adaptive Theme Demo', // Название приложения
          theme: theme, // Используемая светлая тема
          locale: locale, // Текущая локаль приложения
          darkTheme: darkTheme, // Используемая темная тема
          supportedLocales:
              S.delegate.supportedLocales, // Поддерживаемые локали приложения
          localizationsDelegates: const [
            // Делегаты для локализации
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: HomePage(), // Главная страница приложения
        ),
      ),
    );
  }
}
