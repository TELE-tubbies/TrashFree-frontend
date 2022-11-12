import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trashfree/common/widgets/text_subtitle.dart';
import 'package:trashfree/common/widgets/text_title.dart';
import 'package:trashfree/constants/color_constants.dart';

import 'story_onboarding_controller.dart';

double percentageWidth(BuildContext context, double percentage) {
  return MediaQuery.of(context).size.width * percentage;
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.selectedPageIndex,
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      TextTitle(
                        text: controller.onboardingPages[index].title,
                        fontSize: 28,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextSubtitle(
                          text: controller.onboardingPages[index].description,
                          textAlign: TextAlign.center,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Image.asset(
                        controller.onboardingPages[index].imageAsset,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  );
                }),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.21,
              width: percentageWidth(context, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 14,
                        dotWidth: 14,
                        spacing: 16,
                        dotColor: Colors.black26,
                        activeDotColor: primaryColor),
                    onDotClicked: (index) => controller.pageController
                        .animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.11,
              width: percentageWidth(context, 1),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.15),
                child: ElevatedButton(
                  onPressed: () async {
                    Box settingBox = Hive.box('SETTINGS');

                    if (controller.isLastPage) {
                      settingBox.put('isFirstTime', false);
                    }
                    controller.forwardAction();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    backgroundColor: primaryColor,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: Obx(() {
                      return Text(
                        controller.isLastPage ? "GET STARTED" : "NEXT",
                        style: const TextStyle(fontSize: 18, color: white),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: MediaQuery.of(context).size.height * 0.03,
                right: 0,
                left: 0,
                child: Obx(() => controller.isLastPage
                    ? const Text("")
                    : TextButton(
                        onPressed: controller.jumpTo,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      )))
          ],
        ),
      ),
    );
  }
}
