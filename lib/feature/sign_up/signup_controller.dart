import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/authentication/firebase_authentication.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isLoading = false.obs;

  onSubmit() async {
    final result = await FirebaseAuthentication.signUpWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    if (result) {
      Get.dialog(Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text("Signup Success"),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("OK"))
          ],
        ),
      ));
    }
  }

  String? emailValidator(String? value) {
    if (GetUtils.isEmail(value ?? "")) {
      return null;
    }
    return "Enter valid email";
  }
}
