import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/login/login_controller.dart';
import 'package:test_flutter06012024/feature/sign_up/signup_view.dart';
import 'package:test_flutter06012024/themes/theme_controller.dart';
import '../images/image_extansion.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final themeData = themeController.themeData;
    final controller = Get.find<LoginController>();

    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   title: const Padding(
        //     padding: EdgeInsets.all(100.0),
        //     child: Text(
        //       'LoginPage',
        //       style: TextStyle(
        //         fontSize: 30,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        backgroundColor: themeData.value.color.lightBackground,
        body: Stack(
          children: [
            SafeArea(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            themeController.changeTheme();
                            // Get.changeTheme(Get.isDarkMode
                            //     ? ThemeData.light()
                            //     : ThemeData.dark());
                          },
                          child: const Text(
                            "Change Theme",
                          ),
                        ),
                        Image.asset(ImageAssest.techMasterCard),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.account_circle),
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              labelText: 'Username'),
                          onChanged: controller.onChangedUsername,
                          validator: controller.validatorUsername,
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextFormField(
                            controller: controller.passwordController,
                            obscureText: !controller.showPassword.value,
                            decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              labelText: 'Password',
                              suffixIcon: GestureDetector(
                                onTap: controller.showHidePassword,
                                child: Icon(controller.showPassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            onChanged: controller.onChangedPassword,
                            validator: controller.validatorPassword,
                          ),
                        ),

                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.onSubmitLogin();
                              // Get.toNamed(
                              //   AppRouterNamed.homepage,
                              //   arguments: HomeArguments(
                              //       username: controller.usernameController.text,
                              //       password: controller.passwordController.text),
                              // );
                            },
                            child: const Text('Đăng Nhập'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(const SignupPage(
                              title: '',
                            ));
                          },
                          child: const Text('Đăng Ký'),
                        ),
                        // const SizedBox(height: 10),
                        // TextButton(
                        //   onPressed: () {
                        //
                        //   },
                        //   child: const Text('Chuyển sang Đăng Ký'),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => (controller.isloading.value)
                ? Container(
                    color: Colors.black.withOpacity(0.8),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  )
                : const SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
