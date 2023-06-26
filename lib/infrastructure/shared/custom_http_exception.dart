import 'package:dio/dio.dart';

class CustomHttpException implements Exception {
  String? response;
  int? code;
  DioError exception;
  String? type;
  CustomHttpException(this.response, this.code, this.exception,this.type);
}