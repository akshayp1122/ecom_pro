import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SingleProductController extends GetxController {
  var isLoading = true.obs;
  var product = {}.obs;

  final Dio _dio = Dio();

  Future<void> fetchSingleProduct(int id) async {
    try {
      isLoading(true);
      final response = await _dio.get('https://fakestoreapi.com/products/$id');
      product.value = response.data;
    } catch (e) {
      print("Error fetching product: $e");
    } finally {
      isLoading(false);
    }
  }
}
