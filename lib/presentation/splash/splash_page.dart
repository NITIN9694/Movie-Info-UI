import 'package:flutter/material.dart';
import 'package:gearpro/presentation/splash/splash_controller.dart';
import 'package:gearpro/res.dart';
import 'package:get/get.dart';
import '../../infrastructure/core/base/base_view.dart';

class SplashPage extends BaseView<SplashController> {
  SplashPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(Res.splash_screen), fit: BoxFit.fitWidth),
    color: Colors.black54,
    ),
    child:ScaleTransition(
    scale: controller.animation,
    child: Container(
padding: const EdgeInsets.symmetric(
  horizontal: 90,
  vertical: 50
),
    child: Image.asset(Res.app_logo,

      fit: BoxFit.contain,
    ),

    ),
    )));
  }
}
