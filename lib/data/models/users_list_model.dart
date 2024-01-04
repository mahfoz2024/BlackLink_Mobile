// To parse this JSON data, do
//
//     final userListModel = userListModelFromJson(jsonString);

import 'dart:convert';

UserListModel userListModelFromJson(String str) => UserListModel.fromJson(json.decode(str));

String userListModelToJson(UserListModel data) => json.encode(data.toJson());

class UserListModel {
  UserListModel({
    this.id,
    this.niceName,
    this.age,
    this.mainPhotoUrl,
  });

  String? id;
  String? niceName;
  int? age;
  String? mainPhotoUrl;

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
    id: json["id"],
    niceName: json["niceName"],
    age: json["age"],
    mainPhotoUrl: json["mainPhotoUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "niceName": niceName,
    "age": age,
    "mainPhotoUrl": mainPhotoUrl,
  };
}
