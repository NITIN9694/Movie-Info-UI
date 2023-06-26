import 'package:flutter/material.dart';
import 'package:gearpro/infrastructure/navigation/routes.dart';
import 'package:gearpro/presentation/activity_detail/movie_detail_controller.dart';

import 'package:gearpro/res.dart';
import '../../infrastructure/core/base/base_view.dart';
import '../../infrastructure/theme/colors.theme.dart';
import '../../infrastructure/theme/text.theme.dart';
import 'package:get/get.dart';

class MovieDetailPage extends BaseView<MovieDetailController> {
  MovieDetailPage({super.key});

  @override
  Widget body(BuildContext context) {
    Get.lazyPut(() => MovieDetailController());
    return SafeArea(
        child: Obx(
      () => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(controller.imagePath.value.toString()),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: Colors.black)),
            ),
            SizedBox(),
            Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.title.value.toString(),
                      textAlign: TextAlign.start,
                      style: fontSpringBoldTextStyle(
                          fontSize: 30.0, color: ColorsTheme.colWhite),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //                 controller.date.value != null
                    //                     ? Text(
                    //                        DateTime dateTime = DateTime.parse(inputDate);
                    // final newFormat = DateFormat('dd MMM yyyy');
                    // return newFormat.format(dateTime);
                    //                         controller
                    //                             .convertDateFormat(controller.date.value)
                    //                             .toString(),
                    //                         textAlign: TextAlign.start,
                    //                         style: regularTextStyle(
                    //                             fontSize: 15.0,
                    //                             color: ColorsTheme.colWhite,
                    //                             height: 1.4),
                    //                       )
                    //                     : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      controller.descripation.value.toString(),
                      textAlign: TextAlign.start,
                      style: regularTextStyle(
                          fontSize: 15.0,
                          color: ColorsTheme.colWhite,
                          height: 1.4),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
