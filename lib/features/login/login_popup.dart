import 'package:flutter/material.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../../common/controller/authentication_controller.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../../common/widgets/text_title.dart';

class LoginPopup extends StatelessWidget {
  final AuthenticationController controller;
  const LoginPopup({super.key, required this.controller});

  static final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
          child: Column(
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
                  suffixIcon: Icons.remove_red_eye_outlined,
                  labelText: 'Password',
                  controller: controller.passwordLoginController),
            ]),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Login',
            onPressed: () => controller.login(loginFormKey),
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
    );
  }
}
