import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class ApiBase extends DioForNative {
  ApiBase()
      : super(BaseOptions(
          baseUrl: 'https://raw.githubusercontent.com/Biuni',
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
