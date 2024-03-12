import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/sign_up/signup_controller.dart';

void main() {
  runApp(const SignUpPage());
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerSignUp = Get.put(SignUpController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.all(100.0),
            child: Text('Đăng Ký'),
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
                    //Tao textfield username
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      controller: controllerSignUp.usernameSignController,
                      decoration: const InputDecoration(labelText: 'Username'),
                      onChanged: (value) {
                        controllerSignUp.onChangeUsername(value);
                      },
                      validator: controllerSignUp.validatorUsername,
                    ),
                    //Tao textfield password
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.passwordSignController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      onChanged: (value) {},
                      validator: controllerSignUp.validatorPassword,
                    ),
                    //Tao textfiled confirmPassword
                    const SizedBox(height: 20),
                    TextFormField(
                      controller:
                          controllerSignUp.confirmPasswordSignController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(labelText: 'Nhập lại Password'),
                      onChanged: (value) {
                        controllerSignUp.onChangePassword(value);
                      },
                      validator: controllerSignUp.validatorConfirmPassword,
                    ),
                    //Tao textfield ho ten
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.fullNameSignController,
                      decoration: const InputDecoration(labelText: 'Họ tên'),
                      onChanged: (value) {
                        controllerSignUp.onChangeFullNam(value);
                      },
                      validator: (value) =>
                          controllerSignUp.validatorRequired(value, 'Họ tên'),
                    ),
                    //Tao textfield dia chi
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerSignUp.addressSignController,
                      decoration: const InputDecoration(labelText: 'Địa chỉ'),
                      onChanged: (value) {},
                      validator: (value) =>
                          controllerSignUp.validatorRequired(value, 'Địa chỉ'),
                    ),
                    //Tao nut dang ky
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controllerSignUp.onSubmitSignUp,
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
