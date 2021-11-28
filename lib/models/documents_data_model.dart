import 'dart:convert';

DocumentsData documentsDataFromJson(String str) =>
    DocumentsData.fromJson(json.decode(str));

String documentsDataToJson(DocumentsData data) => json.encode(data.toJson());

class DocumentsData {
  DocumentsData({
    this.message,
    this.data,
  });

  String message;
  List<DocumentData> data;

  factory DocumentsData.fromJson(Map<String, dynamic> json) => DocumentsData(
        message: json["message"],
        data: List<DocumentData>.from(
            json["data"].map((x) => DocumentData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DocumentData {
  DocumentData({
    this.id,
    this.data,
  });

  String id;
  Data data;

  factory DocumentData.fromJson(Map<String, dynamic> json) => DocumentData(
        id: json["id"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "data": data.toJson(),
      };
}

class Data {
  Data({this.name, this.id, this.shortName});

  String name;
  String id;
  String shortName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        id: json["id"],
        shortName: json["shortname"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "shortname": shortName,
      };
}
