import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/homepage/home_binding.dart';
import 'package:test_flutter06012024/feature/homepage/home_view.dart';
import 'package:test_flutter06012024/feature/login/login_binding.dart';
import 'package:test_flutter06012024/feature/sign_up/signup_view.dart';
import '../login/login_view.dart';

class AppRouter {
  static final router = [
    //Login
    GetPage(
      name: AppRouterNamed.login,
      page: () => const LoginPage(
        title: '',
      ),
      binding: LoginBinding(),
    ),
    //SignUp
    GetPage(
      name: AppRouterNamed.signUp,
      page: () => const SignupPage(
        title: '',
      ),
    ),
    //HomePage
    GetPage(
      name: AppRouterNamed.homepage,
      page: () => const HomePage(
        title: '',
      ),
      binding: HomeBinding(),
    ),
  ];
}

class AppRouterNamed {
  static String login = '/';
  static String signUp = '/signup';
  static String homepage = '/homepage';
}
