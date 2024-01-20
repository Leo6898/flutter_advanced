import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

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

  void onChangeAddress(address) {
    formKey.currentState?.validate();
  }

  String? validatorUsername(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Username phải có ít nhất 6 ký tự';
    }
    return null;
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password phải có ít nhất 6 ký tự';
    }
    return null;
  }

  String? validatorConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Nhập lại Password không khớp';
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