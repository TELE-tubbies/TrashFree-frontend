import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';

import '../../constants/color_constants.dart';
import '../../constants/dimensions.dart';

class CustomSnackBars {
  static void showErrorSnackBar(String message1, String message2,
      {Color color = Colors.red}) {
    !Get.isSnackbarOpen
        ? Get.snackbar(message1, message2,
            padding: const EdgeInsets.all(20),
            colorText: Colors.black,
            backgroundColor: Colors.red,
            icon: Lottie.asset('assets/lottie/error.json',
                height: deviceHeight * 0.04, repeat: false),
            snackPosition: SnackPosition.BOTTOM)
        : null;
  }

  static void showSuccessSnackBar(
    BuildContext context,
    String message, {
    IconData icon = Icons.check,
    bool showConfetti = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: showConfetti ? Colors.transparent : primaryColor,
        padding: EdgeInsets.zero,
        dismissDirection: DismissDirection.none,
        content: showConfetti
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Lottie.asset('assets/lottie/confetti.json',
                        fit: BoxFit.fill, repeat: false),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(icon, color: white),
                        SizedBox(width: deviceWidth * 0.02),
                        TextSubtitle(text: message)
                      ],
                    ),
                  ),
                ],
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon, color: white),
                    SizedBox(width: deviceWidth * 0.01),
                    TextSubtitle(text: message, fontSize: 18)
                  ],
                ),
              ),
      ));
  }
}
