import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:test_flutter06012024/sign_up/signup_controller.dart';

void main() {
  runApp(SignUpPage());
}
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerSignUp = Get.put(SignUpController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(100.0),
            child: const Text('Đăng Ký'),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: controllerSignUp.formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controllerSignUp.usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                      onChanged: (value) {},
                      validator: controllerSignUp.validatorUsername,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      onChanged: (value) {},
                      validator: (value) => controllerSignUp.validatorPassword(value),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Nhập lại Password'),
                      onChanged: (value) {},
                      validator: (value) => controllerSignUp.validatorConfirmPassword(value),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.fullNameController,
                      decoration: const InputDecoration(labelText: 'Họ tên'),
                      onChanged: (value) {},
                      validator: (value) => controllerSignUp.validatorRequired(value, 'Họ tên'),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.addressController,
                      decoration: const InputDecoration(labelText: 'Địa chỉ'),
                      onChanged: (value) {},
                      validator: (value) => controllerSignUp.validatorRequired(value, 'Địa chỉ'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (controllerSignUp.formKey.currentState!.validate()) {
                          // Thực hiện đăng ký ở đây
                        }
                      },
                      child: const Text('Đăng Ký'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}