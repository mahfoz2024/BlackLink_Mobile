import 'package:blacklink_mobile/data/models/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'base_web_services.dart';

class AuthWebServices {
  final base = BaseWebServices();
  final box = GetStorage();

  Future<int> signUp(SignUpModel model) async {
    try {
      var data = FormData.fromMap({
        'NiceName': model.niceName,
        'Email': model.email,
        'Gender': model.gender,
        'Username': model.username,
        'Birthdate': model.birthDate,
        'Password': model.password,
        'MainPhoto': await MultipartFile.fromFile(
          model.mainPhoto!,
        )
      });
      var response = await base.dio.post('Authentication/SignUp', data: data);
      if (response.statusCode == 201) {
        print('SignUp successful!');
        return response.statusCode!;
      } else {
        // Handle error response
        print('SignUp failed with status code: ${response.statusCode}');
        return response.statusCode!;
      }
    } catch (error) {
      print(error);
      return 500;
    }
  }

  Future<int> logIn(String username, String password) async {
    try {
      var response = await base.dio.post('Authentication/LogIn',
          data: {'username': username, 'password': password});
      print('LogIn successful!');
      box.write('token', response.data["token"]);
      return response.statusCode!;
    } on DioException catch (error) {
      print(error.message);
      return error.response!.statusCode!;
    }
  }
}
