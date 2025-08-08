import 'package:ecom_pro/controllers/single_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductPage extends StatelessWidget {
  final int productId;

  SingleProductPage({required this.productId});

  final SingleProductController controller = Get.put(SingleProductController());

  @override
  Widget build(BuildContext context) {
    controller.fetchSingleProduct(productId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        var product = controller.product;
        if (product.isEmpty) {
          return const Center(child: Text("No product found"));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product['image'],
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                product['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "\$${product['price']}",
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(product['description']),
              const SizedBox(height: 20),
              Text(
                "Category: ${product['category']}",
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 20),
              Text(
                "Rating: ${product['rating']['rate']} ⭐ (${product['rating']['count']} reviews)",
              ),
            ],
          ),
        );
      }),
    );
  }
}
