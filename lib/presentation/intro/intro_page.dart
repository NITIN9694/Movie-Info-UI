import 'package:flutter/material.dart';
import 'package:gearpro/infrastructure/theme/colors.theme.dart';
import 'package:gearpro/infrastructure/theme/text.theme.dart';
import 'package:gearpro/presentation/intro/intro_controller.dart';
import 'package:gearpro/res.dart';
import 'package:get/get.dart';
import '../../infrastructure/core/base/base_view.dart';

class IntroPage extends BaseView<IntroController> {
  IntroPage({super.key});

  @override
  Widget body(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        PageView.builder(
          controller: controller.pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            controller.currentIndex.value = index;
            controller.introPageList.refresh();
          },
          itemCount: controller.introPageList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(controller.introPageList[index].image!),
                      fit: BoxFit.cover)),
            );
          },
        ),
        Positioned(
            left: 20,
            right: 20,
            bottom: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => SizedBox(
                    height: 20,
                    child: ListView.builder(
                        itemCount: controller.introPageList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          print(controller.currentIndex.value);
                          return controller.currentIndex.value == index
                              ? Image.asset(Res.active_indicator)
                              : Image.asset(Res.inactive_indicator);
                        }),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(() => controller.currentIndex.value == 3
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.onTapGetStarted();
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 60),
                                child: Center(
                                  child: Text(
                                    "get_started".tr,
                                    style: boldTextStyle(
                                        fontSize: 13.0,
                                        color: ColorsTheme.colBlack),
                                  ),
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.all(18),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(
                                Res.ic_apple,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Center(
                              child: Text(
                                "Skip",
                                style: regularTextStyle(
                                    fontSize: 13.0,
                                    color: ColorsTheme.colWhite),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.onTapNextPage();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next",
                                    style: boldTextStyle(
                                        fontSize: 13.0,
                                        color: ColorsTheme.colBlack),
                                  ),
                                  const Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
              ],
            ))
      ],
    ));
  }
}
