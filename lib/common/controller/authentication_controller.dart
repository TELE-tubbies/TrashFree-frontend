import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../constants/api_constants.dart';
import '../widgets/custom_snackbar.dart';

class AuthenticationController extends GetxController {
  RxBool obsecureLoginPassword = true.obs;
  RxBool obsecureRegisterPassword = true.obs;

  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneNumberTextController =
      TextEditingController();

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  final Map<String, String> header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  void login(BuildContext context, GlobalKey<FormState> formKey) async {
    if (!_validateEmail(emailLoginController.text, context: context)) return;
    if (formKey.currentState!.validate()) {
      final Map<String, String> body = {
        "email": emailLoginController.text,
        "password": passwordLoginController.text
      };

      http.Response response;
      try {
        response = await http.post(Uri.parse(Api.login),
            headers: header, body: jsonEncode(body));
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          CustomSnackBars.showSuccessSnackBar(Get.context!, "Login Successful");
          clearLoginController();
          if (jsonResponse['user']['role'] == 'admin') {
            Get.offAllNamed('/admin_navigation_bar');
          } else {
            Get.offAllNamed('/navigation_bar');
          }
        } else {
          CustomSnackBars.showErrorSnackBar(
              'Login Failed', jsonResponse['message']);
        }
      } catch (err) {
        debugPrint(err.toString());
        Get.snackbar("500 Error", "Internal Server Error");
        return;
      }
    }
  }

  void register(BuildContext context, GlobalKey<FormState> formKey) async {
    if (!_validateEmail(emailTextController.text, context: context)) return;
    if (formKey.currentState!.validate()) {
      final Map<String, String> body = {
        "username": usernameTextController.text,
        "email": emailTextController.text,
        "password": passwordTextController.text,
        "name": nameTextController.text,
        "phone_number": phoneNumberTextController.text
      };

      http.Response response;
      try {
        response = await http.post(Uri.parse(Api.register),
            headers: header, body: jsonEncode(body));

        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          CustomSnackBars.showSuccessSnackBar(
              Get.context!, "Registered Successfully",
              showConfetti: true);
          clearRegisterController();
          Get.offAllNamed('/navigation_bar');
        } else {
          CustomSnackBars.showErrorSnackBar(
              'Register Failed', jsonResponse['message']);
        }
      } catch (err) {
        debugPrint(err.toString());
        Get.snackbar("500 Error", "Internal Server Error");
        return;
      }
    }
  }

  bool _validateEmail(String value, {required BuildContext context}) {
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      CustomSnackBars.showErrorSnackBar(
          'Request Failed', 'Please enter a valid email address');
      return false;
    }
    return true;
  }

  void clearLoginController() {
    emailLoginController.clear();
    passwordLoginController.clear();
  }

  void clearRegisterController() {
    usernameTextController.clear();
    emailTextController.clear();
    passwordTextController.clear();
    nameTextController.clear();
    phoneNumberTextController.clear();
  }

  @override
  void onClose() {
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    nameTextController.dispose();
    phoneNumberTextController.dispose();
    super.onClose();
  }
}
