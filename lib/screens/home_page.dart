// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:translater/generated/l10n.dart';
import 'package:translater/constants/app_styles.dart';
import 'package:translater/repo/repo_languages.dart';
import 'package:translater/repo/repo_settings.dart';
import 'package:translater/repo/repo_text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:translater/screens/favorites_screen.dart';
import 'package:translater/screens/widgets/code2name.dart';
import 'package:translater/screens/widgets/favorites_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkModeEnabled = false;
  bool themeDark = false;
  String translatedText = '';
  List<String>? languageStrings = [];
  String? sourceLanguage;
  String? targetLanguage;
  String appLang = '';
  String? originalText;

  final _repoText = RepoTranslate();
  final _repoLang = RepoLanges();

  final _textController = TextEditingController();

  Future<String?> _translateText() async {
    String textToTranslate = _textController.text;
    originalText = textToTranslate;
    final textResponse = await _repoText.translate(
      textToTranslate,
      sourceLanguage ?? 'auto',
      targetLanguage ?? 'ru',
    );
    final resList =
        textResponse.dataText?.data.translations.first.translatedText;
    return resList;
  }

  @override
  void initState() {
    final repoSettings = Provider.of<RepoSettings>(
      context,
      listen: false,
    );
    repoSettings.init().whenComplete(() async {
      var defaultLocale = const Locale('ru', 'RU');
      final locale = await repoSettings.readLocale();
      appLang = locale.toString();
      if (locale == 'en') {
        defaultLocale = const Locale('en');
      }
    });
    super.initState();
    _getLanges();
  }

  Future<void> _getLanges() async {
    final langResponse = await _repoLang.getLanges();
    setState(() {
      languageStrings = langResponse.dataLanges?.data.getLanguageStrings();

      // Check if "ru" and "en" are present in the list
      bool? hasRu = languageStrings?.contains("ru");
      bool? hasEn = languageStrings?.contains("en");

      // If both "ru" and "en" are present, remove them from their current positions
      if (hasRu! && hasEn!) {
        languageStrings?.remove("ru");
        languageStrings?.remove("en");
      }

      // Add "auto" as the first element in the list
      languageStrings?.insert(0, "auto");

      // Add "ru" and "en" to the second and third positions if they were present
      if (hasRu) {
        languageStrings?.insert(1, "ru");
      }
      if (hasEn!) {
        languageStrings?.insert(2, "en");
      }
    });
  }

  // Функция для замены переводимого и переведенного текста местами
  void _swapTexts() {
    setState(() {
      if (sourceLanguage == 'auto') {
        sourceLanguage = 'en';
      }
      // Меняем местами переводимый текст и переведенный текст
      final tempText = sourceLanguage;
      sourceLanguage = targetLanguage;
      targetLanguage = tempText;

      // Меняем местами оригинальный текст и переведенный текст
      final tempTranslatedText = originalText;
      originalText = translatedText;
      translatedText = tempTranslatedText!;

      // Обновляем содержимое TextField
      _textController.text = originalText ?? '';
    });
  }

  void _copyTranslatedText() {
    if (translatedText.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: translatedText));
      _showSnackBar('Текст успешно скопирован!');
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).appNameHeader,
          style: AppStyles.s20w500,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              iconSize: 36,
              onPressed: () {
                saveToFavorites(originalText!, translatedText);
                _showSnackBar(S.of(context).);
              },
              icon: Icon(Icons.star_border),
            ),
          ),
          _buildLanguageDropdown(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: DropdownButton<String>(
                  hint: Text(S.of(context).chooseLangSource),
                  value: sourceLanguage,
                  //dropdownColor: Colors.black,
                  items: languageStrings?.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(
                        LanguageHelper.choiseLang(lang, context, appLang),
                        style: AppStyles.s20w500black,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      sourceLanguage = value;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: S.of(context).enterText,
                  ),
                  style: AppStyles.s24w400,
                  controller: _textController,
                  maxLines:
                      null, // Указываем null, чтобы текстовое поле могло расти по высоте
                ),
              ),
              IconButton(
                iconSize: 36,
                onPressed: _swapTexts, // Вызываем функцию для замены текстов
                icon: Icon(Icons.swap_vert_rounded),
              ),
              SingleChildScrollView(
                child: DropdownButton<String>(
                  hint: Text(S.of(context).chooseLangTarget),
                  value: targetLanguage,
                  //dropdownColor: Colors.black,
                  items: languageStrings
                      ?.where((lang) => lang != 'auto')
                      .map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(
                        LanguageHelper.choiseLang(lang, context, appLang),
                        style: AppStyles.s20w500black,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      targetLanguage = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // or MainAxisAlignment.end
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: AutoSizeText(
                        translatedText,
                        style: AppStyles.s24w400,
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 36,
                    onPressed:
                        _copyTranslatedText, // Вызовите функцию для копирования переведенного текста
                    icon: Icon(Icons.content_copy_rounded),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final translatedTextResult = await _translateText();
                  setState(() {
                    translatedText = translatedTextResult ?? '';
                  });
                },
                child: Text(
                  S.of(context).translate,
                  style: AppStyles.s24w400,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => FavoritesScreen(),
                    ),
                  );
                },
                child: Text(
                  S.of(context).viewFavorites,
                  style: AppStyles.s24w400,
                ),
              ),
              SizedBox(height: 16.0),
              SwitchListTile(
                title: Text(
                  S.of(context).darkTheme,
                ),
                value:
                    isDarkModeEnabled, // Use the stored boolean to control the switch
                onChanged: (value) {
                  themeDark = !themeDark;
                  setState(() {
                    isDarkModeEnabled =
                        value; // Update the theme state when the switch is toggled
                    if (themeDark) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                    final repoSettings =
                        Provider.of<RepoSettings>(context, listen: false);
                    repoSettings.saveTheme(themeDark);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButton<String>(
      dropdownColor: Colors.black,
      value: Intl.getCurrentLocale(),
      items: [
        DropdownMenuItem(
          value: 'en',
          child: Text(
            S.of(context).english,
            style: AppStyles.s20w500,
          ),
        ),
        DropdownMenuItem(
          value: 'ru_RU',
          child: Text(
            S.of(context).russian,
            style: AppStyles.s20w500,
          ),
        ),
      ],
      onChanged: (value) async {
        if (value == 'ru_RU') {
          await S.load(
            const Locale('ru', 'RU'),
          );
          appLang = 'ru';
          setState(() {});
        } else if (value == 'en') {
          await S.load(
            const Locale('en'),
          );
          appLang = 'en';
          setState(() {});
        }
        final repoSettings = Provider.of<RepoSettings>(context, listen: false);
        repoSettings.saveLocale(value!);
      },
    );
  }
}
