import 'package:get/get.dart';
import '../services/api_service.dart';
import '../models/login_response.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var token = "".obs;

  final ApiService _apiService = ApiService();

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await _apiService.login(username, password);
      final loginResponse = LoginResponse.fromJson(response);
      token.value = loginResponse.token;
      Get.snackbar("Success", "Login successful!");
      Get.offAllNamed("/home");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
