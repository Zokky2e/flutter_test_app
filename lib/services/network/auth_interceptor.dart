// auth_interceptor.dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test_app/app_routing.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._authDio);
  final _storage = const FlutterSecureStorage();
  final Dio _authDio;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: 'idToken');

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await authService.refreshToken();

      if (refreshed) {
        final newToken = await _storage.read(key: 'idToken');

        final retryRequest = err.requestOptions;
        retryRequest.headers['Authorization'] = 'Bearer $newToken';

        final response = await _authDio.fetch(retryRequest);
        return handler.resolve(response);
      }
    }

    handler.next(err);
  }
}
