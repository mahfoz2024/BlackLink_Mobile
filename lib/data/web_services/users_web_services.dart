

import 'package:blacklink_mobile/data/models/photo_model.dart';
import 'package:dio/dio.dart';

import '../models/user_profile_model.dart';
import '../models/users_list_model.dart';
import 'base_web_services.dart';

class UsersWebServices {
  final base = BaseWebServices();

  Future<List<UserListModel>> getAllUsers() async {
    var response = await base.dio.get('User/GetAllUsers');
    return (response.data as List)
        .map((e) => UserListModel.fromJson(e))
        .toList();
  }
  Future<String> getUserBio() async {
    var response = await base.dio.get('User/GetUserBio');
    return response.data;
  }
  Future<List<PhotoModel>> getUserPhotos() async {
    var response = await base.dio.get('User/GetUserPhotos');
    return (response.data as List)
        .map((e) => PhotoModel.fromJson(e))
        .toList();
  }

  Future<UserProfileModel> getCurrentUser() async {
    var response = await base.dio.get('User/GetCurrentUser');
    var data = UserProfileModel.fromJson(response.data);
    return data;
  }
  Future<void> addUserPhoto(String photo)async{
    var data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        photo,
      )
    });
    await base.dio.post('User/AddUserPhoto',data: data);
  }
  Future<void> removeUserPhoto(String id)async{
    await base.dio.delete('User/RemoveUserPhoto?photoId=$id');
  }
  Future<void> addUserBio(String bio)async{
    await base.dio.put('User/AddUserBio?bio=$bio');
  }

}
