import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter06012024/feature/model/data_state.dart';
import 'package:test_flutter06012024/feature/model/signup_request.dart';
import 'package:test_flutter06012024/feature/network/repositories/signUp_reponsitory.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameSignController = TextEditingController();
  final TextEditingController passwordSignController = TextEditingController();
  final TextEditingController confirmPasswordSignController =
      TextEditingController();
  final TextEditingController fullNameSignController = TextEditingController();
  final TextEditingController addressSignController = TextEditingController();

  void onChangeUsername(username) {
    formKey.currentState?.validate();
  }

  void onChangePassword(password) {
    formKey.currentState?.validate();
  }

  void onChangeConfirmPassword(confirmPassword) {
    formKey.currentState?.validate();
    return;
  }

  void onChangeFullNam(fullName) {
    formKey.currentState?.validate();
  }

  onSubmitSignUp() async {
    final usernameSignValue = usernameSignController.text;
    final passwordSignValue = passwordSignController.text;
    final confirmPasswordSignValue = confirmPasswordSignController.text;
    final fullnameSignValue = fullNameSignController.text;
    final addressSignValue = addressSignController.text;

    final SignUpRequest signUpRequest = SignUpRequest(
        usernameSign: usernameSignValue,
        passwordSign: passwordSignValue,
        confirmPasswordSign: confirmPasswordSignValue,
        fullNameSign: fullnameSignValue,
        addressSign: addressSignValue);

    final signUpReponseFromRepo =
        await SignUpReponsitory().signUp(signUpRequest);

    if (signUpReponseFromRepo is DataSuccess) {
      Get.back();
    }
  }

//   void onSubmitSignUp() {
//   var controllerSignUp;
//   if (controllerSignUp.formKey.currentState!.validate()) {
//     // Thực hiện đăng ký ở đây
//   }
//   Get.back();
// }

  void onChangeAddress(address) {
    formKey.currentState?.validate();
  }

  String? validatorUsername(String? value) {
    if (value == null || value.length < 6) {
      return 'Username phải có ít nhất 6 ký tự';
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.length < 6) {
      return 'Password phải có ít nhất 6 ký tự';
    }
    return null;
  }

  String? validatorConfirmPassword(String? value) {
    if (value != passwordSignController.text) {
      return 'Không khớp Nhập lại Password';
    }
    return null;
  }

  String? validatorRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName không được để trống';
    }
    return null;
  }
}
