import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), () {
      check();
    });
  }

  Future<void> check() async {
    Box settingBox = Hive.box('SETTINGS');
    bool firstTimeInit = settingBox.get('isFirstTime') ?? true;

    if (firstTimeInit) {
      Get.offAllNamed('/story_onboarding');
    } else {
      Get.offAllNamed('/register_page');
    }
  }
}
