import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunction {
  static String greetingMessage() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Hello';
    }
  }

  static getHeight() {
    if (Get.height <= 300) {
      return Get.height * 0.65;
    } else if (Get.height <= 400 && Get.height > 300) {
      return Get.height * 0.5;
    } else if (Get.height <= 500 && Get.height > 400) {
      return Get.height * 0.4;
    } else if (Get.height <= 600 && Get.height > 500) {
      return Get.height * 0.35;
    } else if (Get.height <= 700 && Get.height > 600) {
      return Get.height * 0.3;
    } else if (Get.height <= 800 && Get.height > 700) {
      return Get.height * 0.25;
    } else if (Get.height <= 900 && Get.height > 800) {
      return Get.height * 0.25;
    } else if (Get.height <= 1000 && Get.height > 900) {
      return Get.height * 0.2;
    } else if (Get.height <= 1100 && Get.height > 1000) {
      return Get.height * 0.2;
    } else if (Get.height <= 1200 && Get.height > 1100) {
      return Get.height * 0.18;
    } else if (Get.height > 1200) {
      return Get.height * 0.15;
    } else {
      return 200;
    }
  }

  static keyboardDismiss(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static getDeviceType() {
    if (GetPlatform.isAndroid) {
      return 'android';
    } else {
      return 'ios';
    }
  }

  static getRatioHeight() {
    print("getHieght==>${Get.height}");
    if (Get.height <= 300) {
      return 1.05;
    } else if (Get.height <= 400 && Get.height > 300) {
      return 1.25;
    } else if (Get.height <= 500 && Get.height > 400) {
      return 1.25;
    } else if (Get.height <= 600 && Get.height > 500) {
      return 0.75;
    } else if (Get.height <= 700 && Get.height > 600) {
      return 0.75;
    } else if (Get.height <= 800 && Get.height > 700) {
      return 0.75;
    } else if (Get.height <= 900 && Get.height > 800) {
      return 0.8;
    } else if (Get.height <= 1000 && Get.height > 900) {
      return 0.9;
    } else if (Get.height <= 1100 && Get.height > 1000) {
      return 0.10;
    } else if (Get.height <= 1200 && Get.height > 1100) {
      return 0.11;
    } else if (Get.height > 1200) {
      return 0.12;
    } else {
      return 0.13;
    }
  }
}
