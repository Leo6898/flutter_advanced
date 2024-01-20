import 'dart:js';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../sign_up/signup_view.dart';
class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  void onChangedUsername(username) {
    formKey.currentState?.validate();
  }

  void onChangedPassword(password) {
    formKey.currentState?.validate();
  }

  String? validatorUsername(username) {
    if ((username ?? '').isEmpty) {
      return 'Username không được để trống';
    } else if ((username ?? '').contains(' ')) {
      return 'Uername không được có dấu cách';
    } else {
      return null;
    }
  }

  String? validatorPassword(Password) {
    if ((Password ?? '').isEmpty) {
      return 'Password không được để trống';
    } else {
      return null;
    }
  }

  void onSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid data');
      if ((usernameController.text != 'vulong') ||
          (passwordController.text != '123456')) {
        Get.dialog(
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Thông tin đăng nhập không đúng, vui lòng nhập lại'),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context as BuildContext);
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            )
        );
      }
    }
    if ((usernameController.text == 'vulong') &&
        (passwordController.text == '123456')) {
        Navigator.push(
            context as BuildContext,
            MaterialPageRoute(
                builder: (context) =>  SignUpPage()));
      }
    }

  void onPressedSignUp() {
    Get.to(const SignUpPage());
  }
  }









