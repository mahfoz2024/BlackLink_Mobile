import 'dart:convert';
class PhotoModel {
  String? id;
  String? url;
  PhotoModel({this.id,this.url});
  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    url: json["url"],
  );
}