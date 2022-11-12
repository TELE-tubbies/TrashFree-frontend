import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/constants/color_constants.dart';
import 'package:trashfree/constants/dimensions.dart';
import 'package:trashfree/features/splash_screen/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/images/logo.png',
                width: deviceWidth * 0.55, fit: BoxFit.cover),
            SizedBox(height: deviceHeight * 0.05),
            const CircularProgressIndicator(),
            const Spacer(),
            const TextSubtitle(
                text: 'TrashFree © Copyright 2022',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF7E7E7E)),
            SizedBox(height: deviceHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
