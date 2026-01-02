import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test_app/services/network/dio_client.dart';

class AuthService {
  final Dio _dio = DioClient.dio;

  final _storage = const FlutterSecureStorage();

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {'email': email, 'password': password},
      );

      await _saveTokens(response.data);
      return true;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// LOGIN
  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      await _saveTokens(response.data);
      return true;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    if (refreshToken == null) return false;

    final res = await _dio.post(
      '/auth/refresh',
      data: {'grant_type': 'refresh_token', 'refresh_token': refreshToken},
      options: Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      ),
    );

    await _storage.write(key: 'idToken', value: res.data['id_token']);
    await _storage.write(key: 'refreshToken', value: res.data['refresh_token']);

    return true;
  }

  /// Save Firebase tokens securely
  Future<void> _saveTokens(Map<String, dynamic> data) async {
    await _storage.write(key: 'idToken', value: data['idToken']);
    await _storage.write(key: 'refreshToken', value: data['refreshToken']);
    await _storage.write(key: 'uid', value: data['localId']);
  }

  /// Get ID token for API calls
  Future<String?> getIdToken() async {
    return await _storage.read(key: 'idToken');
  }

  /// Logout
  Future<void> logout() async {
    await _storage.deleteAll();
  }

  /// Auth check
  Future<bool> isLoggedIn() async {
    return await getIdToken() != null;
  }

  /// Centralized error handling
  Exception _handleError(DioException e) {
    if (e.response != null) {
      return Exception(e.response?.data['detail'] ?? 'Server error');
    }
    return Exception('Network error');
  }
}
