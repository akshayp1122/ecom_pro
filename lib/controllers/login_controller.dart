import 'package:dio/dio.dart';
import 'package:get/get.dart';
// import '../models/login_response.dart';
import 'product_controller.dart';

class LoginController extends GetxController {
  final Dio _dio = Dio();
  var isLoading = false.obs;
  var username = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    if (username.value.trim().isEmpty || password.value.trim().isEmpty) {
      Get.snackbar("Error", "Username and password cannot be empty");
      return;
    }

    try {
      isLoading(true);

      final data = {
        "username": username.value.trim(),
        "password": password.value.trim(),
      };

      final response = await _dio.post(
        'https://fakestoreapi.com/auth/login',
        data: data,
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 &&
              response.data != null &&
              response.data['token'] != null) {
        // final loginResponse = LoginResponse.fromJson(response.data);
        // Get.snackbar("Success", "Logged in. Token: ${loginResponse.token}");

        // ✅ Create ProductController and fetch products immediately
        final productController = Get.put(ProductController());
        await productController.fetchProducts();

        Get.offNamed('/products');
      } else {
        final msg = (response.data is Map && response.data['message'] != null)
            ? response.data['message']
            : 'Invalid credentials';
        Get.snackbar("Error", msg.toString());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
