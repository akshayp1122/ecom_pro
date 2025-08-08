import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class ProductsPage extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (productController.products.isEmpty) {
          return Center(child: Text("No products found"));
        }
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              leading: Image.network(product['image'], width: 50),
              title: Text(product['title']),
              subtitle: Text("\$${product['price']}"),
            );
          },
        );
      }),
    );
  }
}
