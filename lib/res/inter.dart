import 'dart:async';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, requestInterceptorHandler) async {
    print("onRequest");
    print("REQUESTING--------->");
    print(options.headers);
    print("<--------------------");
  }

  @override
  FutureOr<dynamic> onError(DioError dioError, errorInterceptorHandler) {
    print("CONNECTION TIMEOUT");
    if (dioError.type == DioErrorType.connectionTimeout ||
        dioError.type == DioErrorType.badResponse) {
      print(dioError.response);
      print("CONNECTION TIMEOUT");
    }

    return dioError;
  }

  @override
  FutureOr<dynamic> onResponse(
      Response options, responseInterceptorHandler) async {
    print("onResponse");
    if (options.statusCode == 200) {
      print("RESPONSE--------->");
      print(options.data);
      print("<--------------------");
    }

    return options;
  }
}
