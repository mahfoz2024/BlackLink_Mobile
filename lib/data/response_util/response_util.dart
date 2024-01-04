import 'package:dio/dio.dart';

import '../../shared_kernal/enum/error_enum.dart';

class ResponseUtil {
  static Future<ResponseStatus> getErrorType(DioException e) async {
    switch (e.type) {
      case DioExceptionType.badResponse:
        switch (e.response!.statusCode) {
          case 401:
            return ResponseStatus.unAuthorized;
          case 404:
            return ResponseStatus.notFound;
          case 400:
            return ResponseStatus.badRequest;
          case 500:
            return ResponseStatus.internalError;
          default:
            return ResponseStatus.other;
        }
      case DioExceptionType.connectionTimeout:
        return ResponseStatus.connectTimeout;
      case DioExceptionType.receiveTimeout:
        return ResponseStatus.receiveTimeout;
      case DioExceptionType.sendTimeout:
        return ResponseStatus.sendTimeout;
      case DioExceptionType.cancel:
        return ResponseStatus.cancel;
      default:
        return ResponseStatus.other;
    }
  }
}
