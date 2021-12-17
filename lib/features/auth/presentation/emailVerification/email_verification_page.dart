import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/blocking_progress.dart';
import 'email_verification_controller.dart';

class EmailVerificationPage extends GetView<EmailVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BlockingProgress(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.warning,
                    size: 100,
                    color: Colors.orange,
                  ),
                  Text(
                    "メールアドレスはまだ認証されていません",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () => controller.sendVerificationEmail(),
                    child: Text(
                      "認証メールを送る",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
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
}
