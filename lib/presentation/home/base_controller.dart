import 'package:flutter/cupertino.dart';
import 'package:gearpro/infrastructure/model/movie_model.dart';
import 'package:gearpro/infrastructure/network/api_constants.dart';
import 'package:gearpro/infrastructure/shared/custom_http_exception.dart';
import 'package:gearpro/infrastructure/utills/snackbar.util.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class BaseController extends GetxController {
  PageController pageController = PageController();
  final Duration _scrollDuration = Duration(seconds: 3);
  var currentIndex = 0.obs;
  late AnimationController animationController;
  late Animation<double> animation;
  var apiEndPoints = ApiConstants();

  ScrollController scrollController = ScrollController();
  var movieDetailList = <Results>[].obs;
  var isLoadingMovieInfo = false.obs;
  var date = "".obs;

  final String apikey = 'apikey';
  final String readaccesstoken =
      'token';

  var trendingmovies = [].obs;
  var topratedmovies = [].obs;
  var tv = [].obs;
  var pageindex = 0.obs;
  var apipath = "https://image.tmdb.org/t/p/w500";
  @override
  void onInit() {
    loadmovies();

    super.onInit();
  }

  // Future<void> getMovieData() async {
  //   isLoadingMovieInfo.value = true;
  //   try {
  //     final response = await Dio().get(
  //         "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=db95773a7fb212ba790d71f6adac0e7e");
  //     final data = response.data;
  //     final movieList = List<Results>.from(
  //       data.map((data) => Results.fromJson(data)),
  //     );
  //     movieDetailList.value = movieList;
  //     isLoadingMovieInfo.value = false;
  //   } catch (e) {
  //     isLoadingMovieInfo.value = false;
  //     print('Error occurred: $e');
  //   }
  // }

  loadmovies() async {
    isLoadingMovieInfo.value = true;
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    print((trendingresult));

    trendingmovies.value = trendingresult['results'];
    topratedmovies.value = topratedresult['results'];
    tv.value = tvresult['results'];
    isLoadingMovieInfo.value = false;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  String convertDateFormat(index) {
    DateTime dateTime = DateTime.parse(trendingmovies[index]["first_air_date"]);
    final newFormat = DateFormat('dd MMM yyyy');
    date.value = newFormat.format(dateTime);
    return date.value;
  }
}
