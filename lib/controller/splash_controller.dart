import 'dart:async';

import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../utils/const.dart';

class SplashController extends GetxController {
  var isVisible = false.obs;
  @override
  void onInit() {
    startNavigateTimer();
    startAniTimer();
    super.onInit();
  }

  void startNavigateTimer() {
    Timer(const Duration(milliseconds: cSplashDuration), () {
      Get.offNamed(Routes.LOGIN);
      update();
    });
  }

  void startAniTimer() {
    Timer(const Duration(milliseconds: cTimerTenSeconds), () {
      isVisible(true);
      update();
    });
  }
}
