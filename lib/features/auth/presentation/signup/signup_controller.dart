import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routing/app_pages.dart';
import '../../domain/usecases/signup_use_case.dart';

class SignupController extends GetxController {
  final SignupUseCase _signupUseCase;

  SignupController(this._signupUseCase);

  final isLoading = false.obs;

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  Future<void> signup() async {
    final name = nameTextController.text;
    final email = emailTextController.text;
    final password = passwordTextController.text;

    if (name == null || name.isEmpty) {
      Get.snackbar("名前が入力されていません", "名前は必須です");
      return null;
    }

    if (email == null || email.isEmpty) {
      Get.snackbar("メールアドレスが入力されていません", "メールアドレスは必須です");
      return null;
    }

    if (password == null || password.isEmpty) {
      Get.snackbar("パスワードが入力されていません", "パスワードは必須です");
      return null;
    }

    isLoading.value = true;
    final result = await _signupUseCase(SignupParams(name, email, password));
    result.fold(
      (value) {
        isLoading.value = false;
        Get.offNamed(Routes.EMAIL_VERIFICATION);
      },
      (exception) {
        isLoading.value = false;
        Get.snackbar("登録エラー", exception.toString());
      },
    );
  }
}
