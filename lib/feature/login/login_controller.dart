import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/router/router.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final showPassword = false.obs;
  final isloading = false.obs;

  void onChangedUsername(username) {
    formKey.currentState?.validate();
  }

  void showHidePassword() {
    showPassword.value = !showPassword.value;
  }

  void onChangedPassword(password) {
    formKey.currentState?.validate();
  }

  String? validatorUsername(username) {
    if (GetUtils.isUsername(username)) {
      return "Username không hợp lệ";
    }
    return null;
  }

  String? validatorPassword(password) {
    if ((password ?? '').isEmpty) {
      return 'Password không được để trống';
    } else {
      return null;
    }
  }

  onSubmitLogin() async {
    Get.toNamed(AppRouterNamed.homepage);

    // final emailValue = emailController.text;
    // final passwordValue = passwordController.text;

    // final LoginRequest loginRequest =
    //     LoginRequest(email: emailValue, password: passwordValue);

    // isloading.value = true;
    // final loginReponseFromRepo = await LoginRepository().login(loginRequest);
    // isloading.value = false;
    // if (loginReponseFromRepo is DataSuccess) {
    //   Get.toNamed(
    //     AppRouterNamed.homepage,
    //     arguments: HomeArguments(
    //       username: emailController.text,
    //       password: passwordController.text,
    //     ),
    //   );
    // }

    // if (loginReponseFromRepo is DataFailed) {
    //   _showErrorLoginDialog();
    // }
  }

  Future<dynamic> _showErrorLoginDialog() {
    return Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Đã có lỗi xảy ra, vui lòng nhập lại',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Đóng'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void onPressedSignUp() {
  //   Get.to(const SignUpPage());
  // }
}
