
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
  Future<String> getUserEmotionalState() async {
    var response = await base.dio.get('User/GetUserEmotionalState');
    return response.data;
  }
  Future<String> getUserGoal() async {
    var response = await base.dio.get('User/GetUserGoal');
    return response.data;
  }
  Future<String> getUserKids() async {
    var response = await base.dio.get('User/GetUserKids');
    return response.data;
  }
  Future<int> getUserTall() async {
    var response = await base.dio.get('User/GetUserTall');
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
  Future<UserProfileModel> getUser(String id) async {
    var response = await base.dio.get('User/GetUser?Id=$id');
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
  Future<void> setEmotionalState(String state)async{
    await base.dio.put('User/SetEmotionalState?EmotionalState=$state');
  }
  Future<void> setGoal(String goal)async{
    await base.dio.put('User/SetGoal?goal=$goal');
  }
  Future<void> setKids(String kids)async{
    await base.dio.put('User/SetKids?kids=$kids');
  }
  Future<void> setTall(int tall)async{
    await base.dio.put('User/SetTall?tall=$tall');
  }

}
