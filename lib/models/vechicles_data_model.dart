import 'dart:convert';

VechiclesData vechiclesDataFromJson(String str) =>
    VechiclesData.fromJson(json.decode(str));

String vechiclesDataToJson(VechiclesData data) => json.encode(data.toJson());

class VechiclesData {
  VechiclesData({
    this.message,
    this.data,
  });

  String message;
  List<VechicleData> data;

  factory VechiclesData.fromJson(Map<String, dynamic> json) => VechiclesData(
        message: json["message"],
        data: List<VechicleData>.from(
            json["data"].map((x) => VechicleData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class VechicleData {
  VechicleData({
    this.id,
    this.data,
  });

  String id;
  Data data;

  factory VechicleData.fromJson(Map<String, dynamic> json) => VechicleData(
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
