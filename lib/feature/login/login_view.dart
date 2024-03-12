import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/login/login_controller.dart';
import '../images/image_extansion.dart';
import '../sign_up/signup_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Padding(
          padding: EdgeInsets.all(100.0),
          child: Text(
            'LoginPage',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
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
                          Get.to(const SignUpPage());
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
    ));
  }
}
