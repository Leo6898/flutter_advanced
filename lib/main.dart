import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/login/login_binding.dart';
import 'package:test_flutter06012024/feature/router/router.dart';
import 'package:test_flutter06012024/firebase_options.dart';
import 'package:test_flutter06012024/themes/theme_controller.dart';
import 'feature/login/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController(), permanent: true);
    // final isLight = SchedulerBinding.instance?.window.platformBrightness ==
    //     Brightness.light;
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: LoginBinding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(),
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      // themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
      getPages: AppRouter.router,
      home: const LoginPage(
        title: 'Flutter Home Page',
      ),
    );
  }
}
