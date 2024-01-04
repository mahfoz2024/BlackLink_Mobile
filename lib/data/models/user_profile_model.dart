// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));



class UserProfileModel {
  UserProfileModel({
    this.id,
    this.nickName,
    this.bio,
    this.age,
    this.mainPhoto,
    this.gender,
    this.userPhotos,
    this.interests,
  });

  String? id;
  String? nickName;
  String? bio;
  String? mainPhoto;
  int? age;
  String? gender;
  List<String>? userPhotos;
  List<Interest>? interests;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    id: json["id"],
    nickName: json["nickName"],
    bio: json["bio"],
    age: json["age"],
    mainPhoto: json["mainPhoto"],
    gender: json["gender"],
    userPhotos: List<String>.from(json["userPhotos"].map((x) => x)),
    interests: List<Interest>.from(json["interests"].map((x) => Interest.fromJson(x))),
  );


}

class Interest {
  Interest({
    this.id,
    this.interestName,
  });

  String? id;
  String? interestName;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    id: json["id"],
    interestName: json["interestName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "interestName": interestName,
  };
}
