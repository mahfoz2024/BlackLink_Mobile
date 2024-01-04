
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/models/users_list_model.dart';
import '../../../data/response_util/response_util.dart';
import '../../../data/web_services/users_web_services.dart';
import '../../../shared_kernal/enum/error_enum.dart';

class ExploreUsersController extends GetxController {
  @override
  void onInit() async{
    await getAllUsers();
    super.onInit();
  }

  final webServices = UsersWebServices();
  var loading = false.obs;
  var users = <UserListModel>[].obs;
  Rx<ResponseStatus> errorType=ResponseStatus.other.obs;

  Future<void> getAllUsers() async {
    try {
      loading(true);
      users.value = await webServices.getAllUsers();
      loading(false);
    } on DioException catch (e) {
      errorType.value=await ResponseUtil.getErrorType(e);
      loading(false);
    }
  }
}
