import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:gearpro/res.dart';
import 'package:get/get.dart';

import '../../infrastructure/navigation/routes.dart';

class IntroController extends GetxController {
  var introPageList = <IntroPageModel>[].obs;
  PageController pageController = PageController();
  final Duration _scrollDuration = Duration(seconds: 3);
  var currentIndex = 0.obs;
  late Timer _timer;

  @override
  void onInit() {
    setIntroPageModel();
    _timer = Timer.periodic(_scrollDuration, (_) {
      if (pageController.page!.round() == introPageList.length - 1) {
        _timer.cancel();
      } else {
        pageController.nextPage(
          duration: _scrollDuration,
          curve: Curves.easeInOut,
        );
      }
    });

    super.onInit();
  }

  setIntroPageModel() {
    introPageList.add(IntroPageModel(
        image: Res.intro_screen1,
        title: "Reel In Your Personal Best!",
        description:
            "Save on the latest fishing gear, explore nearby locations, techniques, and expert tips. Reel in more with GearPro Guide!"));
    introPageList.add(IntroPageModel(
        image: Res.intro_screen2,
        title: "Gear Up For Thrilling Hunts!",
        description:
            "Find new & innovative hunting gear, get tips on scouting locations, learn ethical hunting practices and save your favorite waypoints."));
    introPageList.add(IntroPageModel(
        image: Res.intro_screen3,
        title: "Embrace The Great Outdoors!",
        description:
            "Discover essential gear, save on your favorites, learn important skills, and explore breathtaking destinations. Get ready for unforgettable outdoor adventures with GearPro Guide."));
    introPageList.add(IntroPageModel(
        image: Res.intro_screen4,
        title: "Gear Up And Enjoy The Thrill Of Cycling!",
        description:
            "Discover a wide range of bikes, helmets, and cycling accessories. Get maintenance tips, training advice, and explore popular biking trails."));
  }

  onTapNextPage() {
    pageController.animateToPage(pageController.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInQuad);
  }

  onTapGetStarted() {
    _timer.cancel();
    Get.toNamed(Routes.home);
  }
}

class IntroPageModel {
  String? image;
  String? title;
  String? description;

  IntroPageModel({this.image, this.description, this.title});
}
