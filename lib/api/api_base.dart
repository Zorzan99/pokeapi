import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiBase extends DioForNative {
  ApiBase()
      : super(BaseOptions(
          baseUrl: 'https://raw.githubusercontent.com/Biuni',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 60000),
        )) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
