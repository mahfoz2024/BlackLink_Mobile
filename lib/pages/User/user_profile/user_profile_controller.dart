
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../data/response_util/response_util.dart';
import '../../../data/web_services/users_web_services.dart';
import '../../../shared_kernal/enum/error_enum.dart';

class UserProfileController extends GetxController {
  RxBool loading = false.obs;
  Rx<UserProfileModel> user = UserProfileModel().obs;
  UsersWebServices services = UsersWebServices();
  Rx<ResponseStatus> errorType = ResponseStatus.other.obs;

  Future getUser() async {
    try {
      loading(true);
      user.value = await services.getCurrentUser();
      loading(false);
    } on DioException catch (e) {
      errorType.value = await ResponseUtil.getErrorType(e);
      loading(false);
    }
  }
}
