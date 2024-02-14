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
  final RxString emotionalState = 'UnSelected'.obs;
  final RxString goal = 'UnSelected'.obs;
  final RxString kids = 'UnSelected'.obs;
  final RxInt tall = 0.obs;
  final ImagePicker imagePicker = ImagePicker();
  final service = UsersWebServices();

  Future<void> pickImage(BuildContext context) async {
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await cropImage(pickedFile, context);
    }
  }

  Future<void> setEmotionalState(String value) async {
    switch (value) {
      case "Single":
        await service.setEmotionalState("Single");
        break;
      case "In a relationship":
        await service.setEmotionalState("Relationship");
        break;
      case "It`s complicated":
        await service.setEmotionalState("Complicated");
        break;
      default:
        await service.setEmotionalState("UnSelected");
    }
  }

  Future<void> setGoal(String value) async {
    switch (value) {
      case "Serious Relationship":
        await service.setGoal("SeriousRelationship");
        break;
      case "Open Relationship":
        await service.setGoal("OpenRelationship");
        break;
      case "Friends":
        await service.setGoal("Friends");
        break;
      case "New Experience":
        await service.setGoal("NewExperience");
        break;
      default:
        await service.setGoal("UnSelected");
    }
  }
  Future<void> setKids(String value) async {
    switch (value) {
      case "I have kids":
        await service.setKids("IHaveKids");
        break;
      case "Not yet , but someday":
        await service.setKids("NotYetButSomeDay");
        break;
      case "No kids":
        await service.setKids("NoKids");
        break;
      case "Childfree":
        await service.setKids("Childfree");
        break;
      default:
        await service.setKids("UnSelected");
    }
  }

  Future<void> getEmotionalState() async {
    String value = await service.getUserEmotionalState();
    switch (value) {
      case "Single":
        emotionalState.value = "Single";
        break;
      case "Relationship":
        emotionalState.value = "In a relationship";
        break;
      case "Complicated":
        emotionalState.value = "It`s complicated";
        break;
      case "UnSelected":
        emotionalState.value = "UnSelected";
        break;
    }
  }
  Future<void> getGoal() async {
    String value = await service.getUserGoal();
    switch (value) {
      case "SeriousRelationship":
        goal.value = "Serious Relationship";
        break;
      case "OpenRelationship":
        goal.value = "Open Relationship";
        break;
      case "Friends":
        goal.value = "Friends";
        break;
      case "NewExperience":
        goal.value = "New Experience";
        break;
      case "UnSelected":
        goal.value = "UnSelected";
        break;
    }
  }
  Future<void> getKids() async {
    String value = await service.getUserKids();
    switch (value) {
      case "IHaveKids":
        kids.value = "I have kids";
        break;
      case "NotYetButSomeDay":
        kids.value = "Not yet , but someday";
        break;
      case "NoKids":
        kids.value = "No kids";
        break;
      case "Childfree":
        kids.value = "Childfree";
        break;
      case "UnSelected":
        kids.value = "UnSelected";
        break;
    }
  }



  Future<void> setTall() async {
    await service.setTall(tall.value);
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
    await getEmotionalState();
    await getGoal();
    await getKids();
    tall.value = await service.getUserTall();
    loading(false);
    super.onInit();
  }
}
