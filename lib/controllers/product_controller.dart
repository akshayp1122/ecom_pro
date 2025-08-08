import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final Dio _dio = Dio();
  var isLoading = false.obs;
  var products = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await _dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200 && response.data != null) {
        products.assignAll(response.data); // Update observable list
      } else {
        products.clear();
      }
    } catch (e) {
      products.clear();
    } finally {
      isLoading(false);
    }
  }
}
