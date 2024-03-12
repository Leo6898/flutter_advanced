import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/login/login_binding.dart';
import 'package:test_flutter06012024/feature/router/router.dart';
import 'feature/login/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        initialBinding: LoginBinding(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        getPages: AppRouter.router,
        home: const LoginPage(
          title: 'Flutter Home Page',
        ));
  }
}
