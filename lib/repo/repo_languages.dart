import 'package:translater/repo/api.dart';
import 'package:translater/repo/data_languages.dart';

class RepoLanges {
  final api = Api();

  Future<ResultRepoLanges> getLanges() async {
    try {
      final resultRequest = await api.dio.get(
        '/language/translate/v2/languages',
        queryParameters: {
          'key': 'AIzaSyBOAJunUf4AIDsySHXJMf8WX2xwx04tEno',
        },
      );

      // print(resultRequest)
      final Map<String, dynamic> jsonDataMap = resultRequest.data ?? {};
      final result = ParseLanguages.fromJson(jsonDataMap);

      //print(result);

      return ResultRepoLanges(dataLanges: result);
    } catch (error) {
      print(error);
      return ResultRepoLanges(errorMessage: "Что-то пошло не так!");
    }
  }
}

class ResultRepoLanges {
  final String? errorMessage;
  final ParseLanguages? dataLanges;

  ResultRepoLanges({
    this.errorMessage,
    this.dataLanges,
  });
}
