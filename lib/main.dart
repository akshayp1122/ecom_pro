import 'package:ecom_pro/screens/login_page.dart';
import 'package:ecom_pro/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FakeStore E-Commerce',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/products', page: () => ProductsPage()),
      ],
    );
  }
}
