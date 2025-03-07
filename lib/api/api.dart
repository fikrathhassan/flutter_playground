import 'package:dio/dio.dart';

abstract class Api {
  late final Dio dio;

  Api() {
    dio = Dio(BaseOptions(
      connectTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    ));

    // Add interceptor
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST\n${options.method} ${options.uri}\n${options.extra}');
          return handler.next(options); // Continue with the request
        },
        onResponse: (response, handler) {
          print(
              'RESPONSE\n ${response.requestOptions.method} ${response.statusCode} ${response.requestOptions.uri}\n${response.data}');
          return handler.next(response); // Continue with the response
        },
        onError: (DioException e, handler) {
          print('ERROR: ${e.message}');
          return handler.next(e); // Continue with the error
        },
      ),
    );
  }
}
