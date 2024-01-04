import 'package:blacklink_mobile/data/models/user_profile_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/response_util/response_util.dart';
import '../../../data/web_services/users_web_services.dart';
import '../../../shared_kernal/enum/error_enum.dart';

class AccountController extends GetxController{
  @override
  void onInit() async{
    await getAllUsers();
    super.onInit();
  }

  final webServices = UsersWebServices();
  var loading = false.obs;
  var user = UserProfileModel().obs;
  Rx<ResponseStatus> errorType=ResponseStatus.other.obs;

  Future<void> getAllUsers() async {
    try {
      loading(true);
      user.value = await webServices.getCurrentUser();
      loading(false);
    } on DioException catch (e) {
      errorType.value=await ResponseUtil.getErrorType(e);
      loading(false);
    }
  }
}