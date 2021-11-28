// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.id,
    this.name,
    this.profilePhoto,
    this.type,
    this.gender,
    this.documentType,
    this.document,
    this.email,
    this.password,
    this.phone,
    this.status,
    this.description,
    this.vehicle,
  });

  String id;
  String name;
  String profilePhoto;
  String type;
  String gender;
  String documentType;
  String document;
  String email;
  String password;
  String phone;
  String status;
  String description;
  String vehicle;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        profilePhoto: json["profile_photo"],
        type: json["type"],
        gender: json["gender"],
        documentType: json["document_type"],
        document: json["document"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        status: json["status"],
        description: json["description"],
        vehicle: json["vehicle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_photo": profilePhoto,
        "type": type,
        "gender": gender,
        "document_type": documentType,
        "document": document,
        "email": email,
        "password": password,
        "phone": phone,
        "status": status,
        "description": description,
        "vehicle": vehicle,
      };
}
