// import 'package:dio/dio.dart';

// class ApiService {
//   final Dio _dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));

//   Future<Map<String, dynamic>> login(String username, String password) async {
//     try {
//       final response = await _dio.post(
//         "/auth/login",
//         data: {
//           "username": username,
//           "password": password,
//         },
//       );
//       return response.data;
//     } catch (e) {
//       throw Exception("Login failed: $e");
//     }
//   }
// }
