import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../data/models/user_profile_model.dart';
import '../../../data/response_util/response_util.dart';
import '../../../data/web_services/users_web_services.dart';
import '../../../shared_kernal/enum/error_enum.dart';

class UserProfileController extends GetxController {
  RxBool loading = false.obs;
  late  String? id;
  UserProfileController({this.id});



  Rx<UserProfileModel> user = UserProfileModel().obs;
  UsersWebServices services = UsersWebServices();
  Rx<ResponseStatus> errorType = ResponseStatus.other.obs;

  Future<void> getUser() async {
    try {
      loading(true);
      user.value = await services.getUser(id!);
      loading(false);
    } on DioException catch (e) {
      errorType.value = await ResponseUtil.getErrorType(e);
      loading(false);
    }
  }
@override
  void onInit() async{
    await getUser();
    super.onInit();
  }

}
