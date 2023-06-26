import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  var imagePath = "".obs;
  var title = "".obs;
  var date = "2023-06-5".obs;
  var descripation = "".obs;
  @override
  void onInit() {
    Future.delayed(Duration.zero, () async {
      imagePath.value = await Get.arguments["image"];
      title.value = await Get.arguments["title"] ?? "";

      date.value = await Get.arguments["date"];

      descripation.value = await Get.arguments["overview"];
    });

    super.onInit();
  }
}
