/// LanguageHelper - класс с утилитами для работы с языками.
///
/// Этот класс содержит статические методы для получения полного названия языка на разных языках.
/// Для использования метода выбора языка `choiseLang`, передайте код языка, контекст и язык приложения.
/// Метод `choiseLang` вернет полное название языка на основе выбранного языка приложения.
///
/// Пример использования:
/// ```dart
/// String code = 'fr';
/// String appLang = 'en';
/// String languageName = LanguageHelper.choiseLang(code, context, appLang);
/// print(languageName); // Выведет 'French' на английском
/// ```
///
/// Поддерживаемые языки:
/// - Английский (en)
/// - Русский (ru)
///
/// При несоответствии выбранного языка приложения с доступными языками, метод `choiseLang` вернет пустую строку.

import 'package:flutter/material.dart';

class LanguageHelper {
  /// Метод выбора языка на основе выбранного языка приложения.
  ///
  /// - [code]: Код языка, для которого нужно получить полное название.
  /// - [context]: Контекст приложения для доступа к локализации.
  /// - [appLang]: Код языка приложения, определяющий язык интерфейса.
  ///
  /// Возвращает полное название языка на основе выбранного языка приложения.

  static String choiseLang(String code, BuildContext context, String appLang) {
    print(appLang);
    if (appLang == 'en') {
      return getFullLanguageNameEn(code, context);
    } else {
      return getFullLanguageNameRu(code, context);
    }
  }

  static String getFullLanguageNameEn(String code, BuildContext context) {
    /// Метод получения полного названия языка на английском.
    ///
    /// - [code]: Код языка, для которого нужно получить полное название.
    /// - [context]: Контекст приложения для доступа к локализации.
    ///
    /// Возвращает полное название языка на английском или пустую строку, если язык не найден.

    switch (code) {
      case 'auto':
        return 'Automatically';
      case 'af':
        return 'Afrikaans';
      case 'ak':
        return 'Akan';
      case 'am':
        return 'Amharic';
      case 'ar':
        return 'Arabic';
      case 'as':
        return 'Assamese';
      case 'ay':
        return 'Aymara';
      case 'az':
        return 'Azerbaijani';
      case 'be':
        return 'Belarusian';
      case 'bg':
        return 'Bulgarian';
      case 'bho':
        return 'Bhojpuri';
      case 'bm':
        return 'Bambara';
      case 'bn':
        return 'Bengali';
      case 'bo':
        return 'Tibetan';
      case 'br':
        return 'Breton';
      case 'bs':
        return 'Bosnian';
      case 'ca':
        return 'Catalan';
      case 'ceb':
        return 'Cebuano';
      case 'ckb':
        return 'Kurdish';
      case 'co':
        return 'Corsican';
      case 'cs':
        return 'Czech';
      case 'cy':
        return 'Welsh';
      case 'da':
        return 'Danish';
      case 'de':
        return 'German';
      case 'doi':
        return 'Dogri';
      case 'dv':
        return 'Divehi';
      case 'dz':
        return 'Dzongkha';
      case 'ee':
        return 'Ewe';
      case 'el':
        return 'Greek';
      case 'en':
        return 'English';
      case 'eo':
        return 'Esperanto';
      case 'es':
        return 'Spanish';
      case 'et':
        return 'Estonian';
      case 'eu':
        return 'Basque';
      case 'fa':
        return 'Persian';
      case 'fi':
        return 'Finnish';
      case 'fj':
        return 'Fijian';
      case 'fo':
        return 'Faroese';
      case 'fr':
        return 'French';
      case 'fy':
        return 'Frisian';
      case 'ga':
        return 'Irish';
      case 'gd':
        return 'Scottish Gaelic';
      case 'gl':
        return 'Galician';
      case 'gn':
        return 'Guarani';
      case 'gom':
        return 'Goan Konkani';
      case 'gu':
        return 'Gujarati';
      case 'ha':
        return 'Hausa';
      case 'haw':
        return 'Hawaiian';
      case 'he':
        return 'Hebrew';
      case 'hi':
        return 'Hindi';
      case 'hmn':
        return 'Hmong';
      case 'hr':
        return 'Croatian';
      case 'ht':
        return 'Haitian Creole';
      case 'hu':
        return 'Hungarian';
      case 'hy':
        return 'Armenian';
      case 'id':
        return 'Indonesian';
      case 'ig':
        return 'Igbo';
      case 'ilo':
        return 'Ilokano';
      case 'is':
        return 'Icelandic';
      case 'it':
        return 'Italian';
      case 'iw':
        return 'Hebrew';
      case 'ja':
        return 'Japanese';
      case 'jv':
        return 'Javanese';
      case 'jw':
        return 'Javanese';
      case 'ka':
        return 'Georgian';
      case 'kk':
        return 'Kazakh';
      case 'km':
        return 'Khmer';
      case 'kn':
        return 'Kannada';
      case 'ko':
        return 'Korean';
      case 'kri':
        return 'Krio (Sierra Leone)';
      case 'ku':
        return 'Kurdish';
      case 'ky':
        return 'Kyrgyz';
      case 'la':
        return 'Latin';
      case 'lb':
        return 'Luxembourgish';
      case 'lg':
        return 'Ganda';
      case 'ln':
        return 'Lingala';
      case 'lo':
        return 'Lao';
      case 'lt':
        return 'Lithuanian';
      case 'lus':
        return 'Lushai';
      case 'lv':
        return 'Latvian';
      case 'mai':
        return 'Maithili';
      case 'mg':
        return 'Malagasy';
      case 'mi':
        return 'Maori';
      case 'mk':
        return 'Macedonian';
      case 'ml':
        return 'Malayalam';
      case 'mn':
        return 'Mongolian';
      case 'mni':
        return 'Manipuri';
      case 'mr':
        return 'Marathi';
      case 'ms':
        return 'Malay';
      case 'mt':
        return 'Maltese';
      case 'my':
        return 'Burmese';
      case 'ne':
        return 'Nepali';
      case 'nl':
        return 'Dutch';
      case 'no':
        return 'Norwegian';
      case 'nso':
        return 'Northern Sotho';
      case 'ny':
        return 'Nyanja';
      case 'om':
        return 'Oromo';
      case 'or':
        return 'Oriya';
      case 'pa':
        return 'Punjabi';
      case 'pl':
        return 'Polish';
      case 'ps':
        return 'Pashto';
      case 'pt':
        return 'Portuguese';
      case 'qu':
        return 'Quechua';
      case 'ro':
        return 'Romanian';
      case 'ru':
        return 'Russian';
      case 'rw':
        return 'Kinyarwanda';
      case 'sa':
        return 'Sanskrit';
      case 'sd':
        return 'Sindhi';
      case 'si':
        return 'Sinhala';
      case 'sk':
        return 'Slovak';
      case 'sl':
        return 'Slovenian';
      case 'sm':
        return 'Samoan';
      case 'sn':
        return 'Shona';
      case 'so':
        return 'Somali';
      case 'sq':
        return 'Albanian';
      case 'sr':
        return 'Serbian';
      case 'st':
        return 'Southern Sotho';
      case 'su':
        return 'Sundanese';
      case 'sv':
        return 'Swedish';
      case 'sw':
        return 'Swahili';
      case 'ta':
        return 'Tamil';
      case 'te':
        return 'Telugu';
      case 'tg':
        return 'Tajik';
      case 'th':
        return 'Thai';
      case 'ti':
        return 'Tigrinya';
      case 'tk':
        return 'Turkmen';
      case 'tl':
        return 'Tagalog';
      case 'tr':
        return 'Turkish';
      case 'ts':
        return 'Tsonga';
      case 'tt':
        return 'Tatar';
      case 'ug':
        return 'Uighur';
      case 'uk':
        return 'Ukrainian';
      case 'ur':
        return 'Urdu';
      case 'uz':
        return 'Uzbek';
      case 'vi':
        return 'Vietnamese';
      case 'xh':
        return 'Xhosa';
      case 'yi':
        return 'Yiddish';
      case 'yo':
        return 'Yoruba';
      case 'zh':
        return 'Chinese';
      case 'zh-CN':
        return 'Chinese (Simplified)';
      case 'zh-TW':
        return 'Chinese (Traditional)';
      default:
        return '';
    }
  }

  static String getFullLanguageNameRu(String code, BuildContext context) {
    switch (code) {
      case 'auto':
        return 'Автоопределение';
      case 'af':
        return 'Африкаанс';
      case 'ak':
        return 'Акан';
      case 'am':
        return 'Амхарский';
      case 'ar':
        return 'Арабский';
      case 'as':
        return 'Ассамский';
      case 'ay':
        return 'Аймара';
      case 'az':
        return 'Азербайджанский';
      case 'be':
        return 'Белорусский';
      case 'bg':
        return 'Болгарский';
      case 'bho':
        return 'Бходжпури';
      case 'bm':
        return 'Бамбара';
      case 'bn':
        return 'Бенгальский';
      case 'bo':
        return 'Тибетский';
      case 'br':
        return 'Бретонский';
      case 'bs':
        return 'Боснийский';
      case 'ca':
        return 'Каталанский';
      case 'ceb':
        return 'Себуано';
      case 'ckb':
        return 'Курдский';
      case 'co':
        return 'Корсиканский';
      case 'cs':
        return 'Чешский';
      case 'cy':
        return 'Валлийский';
      case 'da':
        return 'Датский';
      case 'de':
        return 'Немецкий';
      case 'doi':
        return 'Догри';
      case 'dv':
        return 'Дивехи';
      case 'dz':
        return 'Дзонг-кха';
      case 'ee':
        return 'Эве';
      case 'el':
        return 'Греческий';
      case 'en':
        return 'Английский';
      case 'eo':
        return 'Эсперанто';
      case 'es':
        return 'Испанский';
      case 'et':
        return 'Эстонский';
      case 'eu':
        return 'Баскский';
      case 'fa':
        return 'Персидский';
      case 'fi':
        return 'Финский';
      case 'fj':
        return 'Фиджийский';
      case 'fo':
        return 'Фарерский';
      case 'fr':
        return 'Французский';
      case 'fy':
        return 'Фризский';
      case 'ga':
        return 'Ирландский';
      case 'gd':
        return 'Шотландский гэльский';
      case 'gl':
        return 'Галисийский';
      case 'gn':
        return 'Гуарани';
      case 'gom':
        return 'Конкани';
      case 'gu':
        return 'Гуджарати';
      case 'ha':
        return 'Хауса';
      case 'haw':
        return 'Гавайский';
      case 'he':
        return 'Иврит';
      case 'hi':
        return 'Хинди';
      case 'hmn':
        return 'Хмонг';
      case 'hr':
        return 'Хорватский';
      case 'ht':
        return 'Гаитянский креольский';
      case 'hu':
        return 'Венгерский';
      case 'hy':
        return 'Армянский';
      case 'id':
        return 'Индонезийский';
      case 'ig':
        return 'Игбо';
      case 'ilo':
        return 'Илокано';
      case 'is':
        return 'Исландский';
      case 'it':
        return 'Итальянский';
      case 'iw':
        return 'Иврит';
      case 'ja':
        return 'Японский';
      case 'jv':
        return 'Яванский';
      case 'jw':
        return 'Яванский';
      case 'ka':
        return 'Грузинский';
      case 'kk':
        return 'Казахский';
      case 'km':
        return 'Кхмерский';
      case 'kn':
        return 'Каннада';
      case 'ko':
        return 'Корейский';
      case 'kri':
        return 'Криоло';
      case 'ku':
        return 'Курдский';
      case 'ky':
        return 'Киргизский';
      case 'la':
        return 'Латынь';
      case 'lb':
        return 'Люксембургский';
      case 'lg':
        return 'Ганда';
      case 'ln':
        return 'Лингала';
      case 'lo':
        return 'Лаосский';
      case 'lt':
        return 'Литовский';
      case 'lus':
        return 'Мизо';
      case 'lv':
        return 'Латышский';
      case 'mai':
        return 'Майтхили';
      case 'mg':
        return 'Малагасийский';
      case 'mi':
        return 'Маори';
      case 'mk':
        return 'Македонский';
      case 'ml':
        return 'Малаялам';
      case 'mn':
        return 'Монгольский';
      case 'mni-Mtei':
        return 'Манипурский';
      case 'mr':
        return 'Маратхи';
      case 'ms':
        return 'Малайский';
      case 'mt':
        return 'Мальтийский';
      case 'my':
        return 'Бирманский';
      case 'ne':
        return 'Непальский';
      case 'nl':
        return 'Голландский';
      case 'no':
        return 'Норвежский';
      case 'nso':
        return 'Северный сото';
      case 'ny':
        return 'Ньянджа';
      case 'om':
        return 'Оромо';
      case 'or':
        return 'Ория';
      case 'pa':
        return 'Панджаби';
      case 'pl':
        return 'Польский';
      case 'ps':
        return 'Пушту';
      case 'pt':
        return 'Португальский';
      case 'qu':
        return 'Кечуа';
      case 'ro':
        return 'Румынский';
      case 'ru':
        return 'Русский';
      case 'rw':
        return 'Киньяруанда';
      case 'sa':
        return 'Санскрит';
      case 'sd':
        return 'Синдхи';
      case 'si':
        return 'Сингальский';
      case 'sk':
        return 'Словацкий';
      case 'sl':
        return 'Словенский';
      case 'sm':
        return 'Самоанский';
      case 'sn':
        return 'Шона';
      case 'so':
        return 'Сомали';
      case 'sq':
        return 'Албанский';
      case 'sr':
        return 'Сербский';
      case 'st':
        return 'Сесото';
      case 'su':
        return 'Сунданский';
      case 'sv':
        return 'Шведский';
      case 'sw':
        return 'Суахили';
      case 'ta':
        return 'Тамильский';
      case 'te':
        return 'Телугу';
      case 'tg':
        return 'Таджикский';
      case 'th':
        return 'Тайский';
      case 'ti':
        return 'Тигринья';
      case 'tk':
        return 'Туркменский';
      case 'tl':
        return 'Тагальский';
      case 'tr':
        return 'Турецкий';
      case 'ts':
        return 'Тсонга';
      case 'tt':
        return 'Татарский';
      case 'ug':
        return 'Уйгурский';
      case 'uk':
        return 'Украинский';
      case 'ur':
        return 'Урду';
      case 'uz':
        return 'Узбекский';
      case 'vi':
        return 'Вьетнамский';
      case 'xh':
        return 'Кхоса';
      case 'yi':
        return 'Идиш';
      case 'yo':
        return 'Йоруба';
      case 'zh':
        return 'Китайский';
      case 'zh-CN':
        return 'Китайский (упрощенный)';
      case 'zh-TW':
        return 'Китайский (традиционный)';
      case 'zu':
        return 'Зулу';
      default:
        return '';
    }
  }
}
