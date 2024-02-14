// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    this.id,
    this.nickName,
    this.bio,
    this.age,
    this.tall,
    this.gender,
    this.emotionalState,
    this.goal,
    this.kids,
    this.mainPhoto,
    this.userPhotos,
  });

  String? id;
  String? nickName;
  String? bio;
  int? age;
  int? tall;
  String? gender;
  String? emotionalState;
  String? goal;
  String? kids;
  String? mainPhoto;
  List<String>? userPhotos;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    id: json["id"],
    nickName: json["nickName"],
    bio: json["bio"],
    age: json["age"],
    tall: json["tall"],
    gender: json["gender"],
    emotionalState: json["emotionalState"],
    goal: json["goal"],
    kids: json["kids"],
    mainPhoto: json["mainPhoto"],
    userPhotos: json["userPhotos"] == null ? null : List<String>.from(json["userPhotos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nickName": nickName,
    "bio": bio,
    "age": age,
    "tall": tall,
    "gender": gender,
    "emotionalState": emotionalState,
    "goal": goal,
    "kids": kids,
    "mainPhoto": mainPhoto,
    "userPhotos": userPhotos == null ? null : List<dynamic>.from(userPhotos!.map((x) => x)),
  };
}
