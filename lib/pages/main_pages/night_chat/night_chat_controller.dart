import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../data/response_util/response_util.dart';
import '../../../shared_kernal/enum/error_enum.dart';

class NightChatController extends GetxController {
  RxBool loadingBlogs = false.obs;

  Rx<ResponseStatus> errorType = ResponseStatus.other.obs;

  @override
  void onInit() async {
    await getBlogs();
    super.onInit();
  }

  Future getBlogs() async {
    try {
      loadingBlogs(true);
      loadingBlogs(false);
    } on DioException catch (e) {
      errorType.value=await ResponseUtil.getErrorType(e);
      loadingBlogs(false);
    }
  }
}
