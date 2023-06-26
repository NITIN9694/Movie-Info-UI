import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../navigation/routes.dart';
import '../theme/colors.theme.dart';
import '../theme/text.theme.dart';
import 'common_functions.dart';

class Header {
  static defaultAppBar(String title, context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Material(
          // elevation: 10,
          color: ColorsTheme.colWhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  CommonFunction.keyboardDismiss(context);
                  if(title == "Spot Saved".tr ){
                    Get.offNamed(Routes.navigate);
                  }else {
                    Future.delayed(
                    const Duration(milliseconds: 300),
                    () {
                      Get.back(result: true);
                    },
                  );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    size: 30,
                    Icons.arrow_back,
                    color: ColorsTheme.colPrimary,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: appBarTextStyle(
                      fontSize: dimen18,
                      color: ColorsTheme.colBlack,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 35,
              ),
            ],
          ),
        ));
  }

  static double appBarHeight = 50.0;
}
