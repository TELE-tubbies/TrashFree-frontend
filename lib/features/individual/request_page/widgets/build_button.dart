import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/constants/dimensions.dart';

import '../request_page_controller.dart';

Widget buildButton(String text, String iconPath, int index) {
  final RequestPageController controller = Get.find<RequestPageController>();

  return ElevatedButton(
    onPressed: () => controller.setCategoryIndex(text),
    style: ElevatedButton.styleFrom(
      backgroundColor: controller.bgColor(text),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconPath, color: controller.fontColor(text)),
        SizedBox(height: deviceHeight * 0.02),
        TextSubtitle(
            text: text,
            fontSize: 13,
            color: controller.fontColor(text),
            fontWeight: FontWeight.w500),
      ],
    ),
  );
}
