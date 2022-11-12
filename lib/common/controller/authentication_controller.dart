import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../../constants/api_constants.dart';
import '../widgets/custom_snackbar.dart';

class AuthenticationController extends GetxController {
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final TextEditingController emailLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();

  final Map<String, String> header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  void login(GlobalKey<FormState> formKey) async {
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
          Get.offAndToNamed('/navigation_bar');
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

  void register(GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      final Map<String, String> body = {
        "username": usernameTextController.text,
        "email": emailTextController.text,
        "password": passwordTextController.text
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
          Get.offAndToNamed('/homescreen');
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

  void clearLoginController() {
    emailLoginController.clear();
    passwordLoginController.clear();
  }

  void clearRegisterController() {
    usernameTextController.clear();
    emailTextController.clear();
    passwordTextController.clear();
  }

  @override
  void onClose() {
    usernameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }
}
