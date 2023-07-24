/*
/ Api - класс для работы с HTTP-запросами к API
/
/ Этот класс использует библиотеку Dio для выполнения HTTP-запросов к
/ API сервису перевода текста. Он предоставляет базовую настройку Dio и
/ добавляет необходимые перехватчики (interceptors) для обработки запросов и ответов.
/
/ Пример использования:
/ ```dart
/ final api = Api(); // Создание экземпляра класса Api
/ final response = await api.dio.get('/some_endpoint'); // Выполнение GET запроса
/ print(response.data); // Вывод данных ответа
*/
import 'package:dio/dio.dart';

class Api {
  late final dio = Dio(options)
    ..interceptors.addAll(
      [_BasicInterceptor()],
    );

  final options = BaseOptions(
    baseUrl: 'https://translation.googleapis.com',
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  );
}

class _BasicInterceptor implements Interceptor {
  @override
  void onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(error);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.contentType = 'application/json';
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    handler.next(response);
  }
}
