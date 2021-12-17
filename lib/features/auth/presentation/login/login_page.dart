import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/blocking_progress.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/scrollable_centered_sized_box.dart';
import '../../../../routing/app_pages.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
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
                  AppLogo(),
                  SizedBox(height: 30),
                  Text('ログイン', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 30),
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
                    onSubmitted: (_) => _verifyLogin(),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD);
                      },
                      child: Text(
                        '',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: MaterialButton(
                      // ignore: deprecated_member_use
                      color: Get.theme.accentColor,
                      onPressed: () => _verifyLogin(),
                      child: Text(
                        'ログイン',
                        style: TextStyle(color: Get.theme.backgroundColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('もしくは'),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: MaterialButton(
                        color: Colors.white,
                        onPressed: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          '新規登録',
                          style:
                              // ignore: deprecated_member_use
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
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

  void _verifyLogin() {
    controller.login();
  }
}
