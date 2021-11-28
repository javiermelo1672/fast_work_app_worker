import 'dart:convert';

GendersData gendersDataFromJson(String str) =>
    GendersData.fromJson(json.decode(str));

String gendersDataToJson(GendersData data) => json.encode(data.toJson());

class GendersData {
  GendersData({
    this.message,
    this.data,
  });

  String message;
  List<GenderData> data;

  factory GendersData.fromJson(Map<String, dynamic> json) => GendersData(
        message: json["message"],
        data: List<GenderData>.from(
            json["data"].map((x) => GenderData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GenderData {
  GenderData({
    this.id,
    this.data,
  });

  String id;
  Data data;

  factory GenderData.fromJson(Map<String, dynamic> json) => GenderData(
        id: json["id"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.name,
    this.id,
  });

  String name;
  String id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
