import 'package:gearpro/presentation/activity_detail/movie_detail.dart';
import 'package:gearpro/presentation/activity_detail/movie_detail_binding.dart';
import 'package:gearpro/presentation/home/base_binding.dart';
import 'package:gearpro/presentation/home/base_page.dart';
import 'package:gearpro/presentation/intro/intro_binding.dart';
import 'package:gearpro/presentation/intro/intro_page.dart';

import 'package:get/get.dart';

import '../../presentation/splash/splash_binding.dart';
import '../../presentation/splash/splash_page.dart';
import 'routes.dart';

class AppPages {
  static List<GetPage> pageList = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => BasePage(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: Routes.movieDetail,
      page: () => MovieDetailPage(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: Routes.intro,
      page: () => IntroPage(),
      binding: IntroBinding(),
    ),
  ];
}
