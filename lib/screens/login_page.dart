import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (val) => loginController.username.value = val,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              onChanged: (val) => loginController.password.value = val,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            Obx(() => loginController.isLoading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => loginController.login(),
                    child: Text("Login"),
                  )),
          ],
        ),
      ),
    );
  }
}
