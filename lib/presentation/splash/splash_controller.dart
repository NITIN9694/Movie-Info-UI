import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/constants/app_constants.dart';
import '../../infrastructure/navigation/routes.dart';
import '../../infrastructure/shared/pref_manager.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> animation;

  @override
  void onInit() {


    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward()
      ..addStatusListener((status) {
        update();
        if (status == AnimationStatus.completed) {
          switchScreen();
        }
      });

    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
    // Future.delayed(Duration.zero,()async{
    //  // await Utils().setFcmToken();
    //   FirebaseMessaging.instance.requestPermission();
    //   var fcmToken = await FirebaseMessaging.instance.getToken();
    //
    // });
    super.onInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  switchScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Get.offNamed(Routes.intro);
    });
  }
  onTapSkip(){

  }

}
