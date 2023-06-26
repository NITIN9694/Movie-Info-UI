import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../utills/snackbar.util.dart';


class AppExceptionHandle {

  showException(code, message, DioError dioError,{required type}) {
    if(type == 'socketError'){
      SnackBarUtil.showError(message: 'no_internet_connection'.tr);
    }
    else{
      if (dioError.type == DioErrorType.connectionTimeout) {
        SnackBarUtil.showError(message: 'connection_timeout_exception'.tr);
      } else if (dioError.type == DioErrorType.receiveTimeout) {
        SnackBarUtil.showError(message: 'connection_timeout_exception'.tr);
      } else {
        if (code == 400) {
          SnackBarUtil.showError(message: message);
        } else if (code == 401 || code == 403) {
          SnackBarUtil.showError(message: "$code ${'access_denied'.tr}");
        } else if (code == 500) {
          SnackBarUtil.showError(message: "$code ${'server_error'.tr}");
        }
        else{
          SnackBarUtil.showError(message: message);
        }
      }
    }
  }
}