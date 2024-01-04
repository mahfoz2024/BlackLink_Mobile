import 'package:blacklink_mobile/data/models/photo_model.dart';
import 'package:blacklink_mobile/data/web_services/users_web_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettingsController extends GetxController {
  final images = <PhotoModel>[].obs;
  final bio = TextEditingController();
  RxBool showDoneButton = false.obs;
  RxBool loading = false.obs;
  final ImagePicker imagePicker = ImagePicker();
  final service = UsersWebServices();

  Future<void> pickImage(BuildContext context) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await cropImage(pickedFile, context);
    }
  }

  Future<void> removePhoto(String id) async {
    await service.removeUserPhoto(id);
    images.value = await service.getUserPhotos();
  }

  Future<void> setImage(CroppedFile imageFile) async {
    await service.addUserPhoto(imageFile.path);
    images.value = await service.getUserPhotos();
  }
  Future<void> setBio() async {
    await service.addUserBio(bio.text);
    bio.text = await service.getUserBio();
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

  @override
  void onInit() async {
    loading(true);
    images.value = await service.getUserPhotos();
    bio.text = await service.getUserBio();
    loading(false);
    super.onInit();
  }
}
