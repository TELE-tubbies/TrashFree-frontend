import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  bool get isFirstPage =>
      selectedPageIndex.value ==
      onboardingPages.length - onboardingPages.length;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offNamed('/register_page');
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  onWillPop() {
    pageController.previousPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  jumpTo() {
    pageController.animateToPage(onboardingPages.length - 1,
        duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        imageAsset: 'assets/images/onboarding1.png',
        title: 'Throw Away Trash Easier',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.'),
    OnboardingInfo(
        imageAsset: 'assets/images/onboarding2.png',
        title: 'Get Your Trash Collected',
        description:
            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
    OnboardingInfo(
        imageAsset: 'assets/images/onboarding3.png',
        title: 'Promos and Offers',
        description:
            'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.'),
  ];
}
