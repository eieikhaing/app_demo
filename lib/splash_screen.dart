import 'package:app_demo/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/mixin_state.dart';

import 'controller/splash_controller.dart';
import 'utils/dimens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MixinBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).focusColor,
                Theme.of(context).primaryColor
              ],
              begin: const FractionalOffset(0, 0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
          child: AnimatedOpacity(
            opacity: controller.isVisible.value ? 1.0 : 0,
            duration: const Duration(milliseconds: cAnimationDuration),
            child: Center(
              child: SizedBox(
                height: dLogoContainerHeight,
                width: dLogoContainerHeight,
                child: Center(
                  child: Image.asset(
                    "assets/images/a10d.png",
                    width: dLogoHeight,
                    height: dLogoHeight,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
