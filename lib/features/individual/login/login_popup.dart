import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../../../common/controller/authentication_controller.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/text_title.dart';

class LoginPopup extends StatelessWidget {
  final AuthenticationController controller;
  const LoginPopup({super.key, required this.controller});

  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Obx(() => controller.isLoginLoading.value
            ? Column(
                children: [
                  SizedBox(height: deviceHeight * 0.05),
                  const CircularProgressIndicator(),
                  SizedBox(height: deviceHeight * 0.04),
                  const Text('Please wait ...'),
                  SizedBox(height: deviceHeight * 0.05),
                ],
              )
            : Column(
                children: [
                  SizedBox(height: deviceHeight * 0.02),
                  SizedBox(
                    width: deviceWidth,
                    child: const TextTitle(text: "Login"),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: loginFormKey,
                    child: Column(children: [
                      CustomTextField(
                        prefixIcon: Icons.email_outlined,
                        labelText: 'Email',
                        controller: controller.emailLoginController,
                      ),
                      CustomTextField(
                          prefixIcon: Icons.lock_outline,
                          obscureText: controller.obsecureLoginPassword.value,
                          suffixIcon: controller.obsecureLoginPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onPressed: () => controller.obsecureLoginPassword
                              .value = !controller.obsecureLoginPassword.value,
                          labelText: 'Password',
                          controller: controller.passwordLoginController),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Login',
                    onPressed: () => controller.login(context, loginFormKey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: deviceHeight * 0.1,
                        bottom: deviceHeight * 0.03),
                    child: const Text(
                        "By continuing you agree to TrashFree's Terms of Services and Privacy Policy",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                ],
              )),
      ),
    );
  }
}
