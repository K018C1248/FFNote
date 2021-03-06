import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/blocking_progress.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/scrollable_centered_sized_box.dart';
import 'signup_controller.dart';

class SignupPage extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BlockingProgress(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScrollableCenteredSizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('新規登録', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 30),
                  AppLogo(),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: controller.nameTextController,
                    labelText: '名前',
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    controller: controller.emailTextController,
                    labelText: 'メールアドレス',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    controller: controller.passwordTextController,
                    obscureText: true,
                    labelText: 'パスワード',
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _signupUser(),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      // ignore: deprecated_member_use
                      color: Theme.of(context).accentColor,
                      onPressed: () => _signupUser(),
                      child: Text(
                        '登録',
                        style: TextStyle(color: Get.theme.backgroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signupUser() {
    controller.signup();
  }
}
