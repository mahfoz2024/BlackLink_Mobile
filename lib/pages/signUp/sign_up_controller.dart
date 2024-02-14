import 'dart:io';
import 'package:blacklink_mobile/data/models/sign_up_model.dart';
import 'package:blacklink_mobile/data/web_services/auth_web_services.dart';
import 'package:blacklink_mobile/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';


class SignUpController extends GetxController {
  TextEditingController niceNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String? gender;
  final ImagePicker imagePicker = ImagePicker();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  DateTime? selectedDate;
  Rx<TextEditingController> textEditingController = TextEditingController().obs;
  Rx<File?> image = Rx<File?>(null);
  final service = AuthWebServices();
  final stateTextWithIcon = ButtonState.idle.obs;
  void setImage(CroppedFile imageFile) {
    image.value = File(imageFile.path);
  }

  Future<void> signUp() async {
    SignUpModel model = SignUpModel(
        niceName: niceNameController.text,
        email: emailController.text,
        username: usernameController.text,
        gender: gender,
        birthDate: selectedDate.toString(),
        password: passwordController.text,
        mainPhoto: image.value!.path);
    final result = await service.signUp(model);
    if (result == 201) {
      Get.offAll(LogIn());
    }
  }

  Future<void> pickImage(BuildContext context) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await cropImage(pickedFile, context);
    }
  }

  Future<void> cropImage(XFile image, BuildContext context) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepPurple,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );

    if (croppedFile != null) {
      setImage(croppedFile);
    }
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      textEditingController.value.text =
          DateFormat('yyyy/MM/dd').format(selectedDate!);
    }
  }

}
