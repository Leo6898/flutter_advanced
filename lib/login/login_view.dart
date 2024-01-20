import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../images/image_extansion.dart';
import '../sign_up/signup_view.dart';
import 'login_controller.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Padding(
        padding: EdgeInsets.all(10.0),
        child: MyHomePage(title: 'Đăng Nhập'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(ImageAssest.techMasterCard),
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.account_circle),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: 'Username'
                      ),
                      onChanged: controller.onChangedUsername,
                      validator: controller.validatorUsername,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controller.passwordController,
                      // obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.remove_red_eye),
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          labelText: 'Password'
                      ),
                      onChanged: controller.onChangedPassword,
                      validator: controller.validatorPassword,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: controller.onSubmit,
                        child: const Text('Đăng Nhập'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: controller.onPressedSignUp,
                      child: const Text('Đăng Ký'),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Get.to(const SignUpPage());
                      },
                      child: const Text('Chuyển sang Đăng Ký'),
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


