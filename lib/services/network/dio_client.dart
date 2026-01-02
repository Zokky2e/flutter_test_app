import 'package:dio/dio.dart';
import 'package:flutter_test_app/config/env.dart';
import 'package:flutter_test_app/services/network/auth_interceptor.dart';

class DioClient {
  static final Dio authDio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  )..interceptors.add(AuthInterceptor(authDio));
}
