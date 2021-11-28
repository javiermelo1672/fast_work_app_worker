import 'dart:convert';

WorksReadyModel worksReadyModelFromJson(String str) =>
    WorksReadyModel.fromJson(json.decode(str));

String worksReadyModelToJson(WorksReadyModel data) =>
    json.encode(data.toJson());

class WorksReadyModel {
  WorksReadyModel({
    this.data,
  });

  List<WorkReadyData> data;

  factory WorksReadyModel.fromJson(Map<String, dynamic> json) =>
      WorksReadyModel(
        data: List<WorkReadyData>.from(
            json["data"].map((x) => WorkReadyData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WorkReadyData {
  WorkReadyData({
    this.id,
    this.data,
  });

  String id;
  Data data;

  factory WorkReadyData.fromJson(Map<String, dynamic> json) => WorkReadyData(
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
    this.userInfo,
    this.state,
    this.workerId,
    this.userId,
    this.title,
    this.price,
    this.createdAt,
    this.userWorker,
    this.description,
    this.listPlaces,
    this.image,
    this.type,
    this.finished,
  });

  User userInfo;
  String state;
  String workerId;
  String userId;
  String title;
  String price;
  DateTime createdAt;
  User userWorker;
  String description;
  List<ListPlace> listPlaces;
  String image;
  String type;
  String finished;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userInfo: User.fromJson(json["user_info"]),
        state: json["state"],
        workerId: json["worker_id"],
        userId: json["user_id"],
        title: json["title"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        userWorker: User.fromJson(json["user_worker"]),
        description: json["description"],
        listPlaces: List<ListPlace>.from(
            json["list_places"].map((x) => ListPlace.fromJson(x))),
        image: json["image"],
        type: json["type"],
        finished: json["finished"],
      );

  Map<String, dynamic> toJson() => {
        "user_info": userInfo.toJson(),
        "state": state,
        "worker_id": workerId,
        "user_id": userId,
        "title": title,
        "price": price,
        "created_at": createdAt.toIso8601String(),
        "user_worker": userWorker.toJson(),
        "description": description,
        "list_places": List<dynamic>.from(listPlaces.map((x) => x.toJson())),
        "image": image,
        "type": type,
        "finished": finished,
      };
}

class ListPlace {
  ListPlace({
    this.place,
    this.placeDescription,
  });

  String place;
  String placeDescription;

  factory ListPlace.fromJson(Map<String, dynamic> json) => ListPlace(
        place: json["place"],
        placeDescription: json["place_description"],
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "place_description": placeDescription,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.profilePhoto,
  });

  String id;
  String name;
  String profilePhoto;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        profilePhoto: json["profile_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_photo": profilePhoto,
      };
}
