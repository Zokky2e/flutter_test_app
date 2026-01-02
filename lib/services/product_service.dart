import 'package:dio/dio.dart';
import 'package:flutter_test_app/components/product_calculator/product_model_output.dart';
import 'package:flutter_test_app/services/network/dio_client.dart';

class ProductService {
  final Dio _dio = DioClient.dio;

  Future<ProductModelOutput> calculatePrice({required double price}) async {
    try {
      final response = await _dio.post('/money/', data: {'price': price});

      return ProductModelOutput.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Centralized error handling
  Exception _handleError(DioException e) {
    if (e.response != null) {
      return Exception(e.response?.data['detail'] ?? 'Server error');
    }
    return Exception('Network error');
  }
}
