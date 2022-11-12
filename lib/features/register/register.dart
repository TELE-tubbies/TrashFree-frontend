import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/common/widgets/custom_button.dart';
import 'package:trashfree/features/login/login_popup.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/common/widgets/text_title.dart';

import '../../common/controller/authentication_controller.dart';
import '../../common/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AuthenticationController controller =
        Get.put(AuthenticationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: deviceHeight,
          child: Column(children: [
            Container(
                height: deviceHeight * 0.2,
                margin: EdgeInsets.only(
                    top: deviceHeight * 0.1, bottom: deviceHeight * 0.04),
                child: Image.asset('assets/images/register.png')),
            SizedBox(
                width: deviceWidth,
                child: const TextTitle(
                  text: "Sign Up",
                  textAlign: TextAlign.left,
                )),
            SizedBox(height: deviceHeight * 0.02),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                        prefixIcon: Icons.edit_outlined,
                        labelText: 'Username',
                        controller: controller.usernameTextController),
                    CustomTextField(
                        prefixIcon: Icons.email_outlined,
                        labelText: 'Email',
                        controller: controller.emailTextController),
                    CustomTextField(
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: Icons.remove_red_eye_outlined,
                        labelText: 'Password',
                        controller: controller.passwordTextController),
                  ],
                )),
            SizedBox(height: deviceHeight * 0.02),
            CustomButton(
                text: 'Sign Up', onPressed: () => controller.register(formKey)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                TextButton(
                    child: const Text('Log In'),
                    onPressed: () => showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        context: context,
                        builder: (context) =>
                            LoginPopup(controller: controller))),
                SizedBox(height: deviceHeight * 0.1)
              ],
            )
          ]),
        ),
      ),
    );
  }
}
