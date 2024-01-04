import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared_kernal/base_strings.dart';

class BaseWebServices {
  Dio dio = Dio();
  final box = GetStorage();
  BaseWebServices() {
    dio.options.baseUrl = '${baseURL}api/';
    // dio.options.connectTimeout =const Duration(seconds: 5) ; //5s
    // dio.options.receiveTimeout = const Duration(seconds: 5);
    dio.options.headers['Authorization'] =
        box.read('token');
  }
}
