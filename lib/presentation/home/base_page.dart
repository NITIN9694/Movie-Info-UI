import 'package:flutter/material.dart';
import 'package:gearpro/infrastructure/theme/colors.theme.dart';
import 'package:gearpro/infrastructure/theme/text.theme.dart';
import 'package:gearpro/presentation/activity_detail/movie_detail.dart';
import 'package:gearpro/res.dart';
import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/utills/slivergrid_delegat.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter/material.dart';
import 'package:gearpro/infrastructure/navigation/routes.dart';
import 'package:gearpro/infrastructure/theme/colors.theme.dart';
import 'package:gearpro/infrastructure/theme/text.theme.dart';

import 'package:gearpro/res.dart';
import '../../../infrastructure/core/base/base_view.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'base_controller.dart';

class BasePage extends BaseView<BaseController> {
  BasePage({super.key});

  @override
  Widget body(BuildContext context) {
    return Obx(() => SafeArea(
        child: controller.isLoadingMovieInfo.value
            ? Container(
                color: Colors.black,
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )),
              )
            : GestureDetector(
                child: Stack(
                  children: [
                    LiquidSwipe.builder(
                      itemCount: controller.trendingmovies.value.length,
                      enableLoop: false,
                      onPageChangeCallback: (index) {
                        controller.pageindex.value = index;
                      },
                      positionSlideIcon: 0.88,
                      slideIconWidget: Image.asset(
                        Res.home_swip,
                        height: 150,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(controller.apipath +
                                  controller.trendingmovies[index]
                                          ['poster_path']
                                      .toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      bottom: 70,
                      left: 0,
                      right: 0,
                      child: GestureDetector(
                          onVerticalDragDown: (DragDownDetails details) {
                            Get.to(MovieDetailPage(),
                                transition: Transition.downToUp,
                                duration: Duration(seconds: 1),
                                arguments: {
                                  "image": controller.apipath +
                                      controller.trendingmovies[controller
                                              .pageindex.value]['poster_path']
                                          .toString(),
                                  "overview": controller.trendingmovies[
                                          controller.pageindex.value]
                                          ['overview']
                                      .toString(),
                                  "date": controller.trendingmovies[controller
                                          .pageindex.value]['first_air_date']
                                      .toString(),
                                  "title": controller.trendingmovies[controller
                                          .pageindex.value]['original_title']
                                      .toString(),
                                });
                          },
                          child: Container(
                            padding:
                                EdgeInsets.only(top: 90, left: 90, right: 90),
                            child: Center(
                              child: Lottie.asset(Res.scroll_up,
                                  height: 60, width: 60),
                            ),
                          )),
                    )
                  ],
                ),
              )));
  }
}
