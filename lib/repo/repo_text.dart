import 'package:translater/generated/l10n.dart';
import 'package:translater/repo/api.dart';
import 'package:translater/repo/data_text.dart';

class RepoTranslate {
  final api = Api();

  Future<ResultRepoTranslate> translate(
      String texts, String sourceLanguage, String targetLanguage) async {
    try {
      final Map<String, dynamic> queryParameters = {
        'q': texts,
        'target': targetLanguage,
        'key': 'AIzaSyBOAJunUf4AIDsySHXJMf8WX2xwx04tEno'
      };

      // Добавляем параметр "source" только если sourceLanguage не равен "auto"
      if (sourceLanguage != 'auto') {
        queryParameters['source'] = sourceLanguage;
      }

      final resultRequest = await api.dio.get(
        '/language/translate/v2',
        queryParameters: queryParameters,
      );

      final Map<String, dynamic> jsonDataMap = resultRequest.data ?? {};
      final result = Translite.fromJson(jsonDataMap);

      return ResultRepoTranslate(dataText: result);
    } catch (error) {
      print(error);
      return ResultRepoTranslate(errorMessage: "Что-то пошло не так!");
    }
  }
}

class ResultRepoTranslate {
  final String? errorMessage;
  final Translite? dataText;

  ResultRepoTranslate({
    this.errorMessage,
    this.dataText,
  });
}
