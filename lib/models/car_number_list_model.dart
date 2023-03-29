// To parse this JSON data, do
//
//     final carNumberListModel = carNumberListModelFromJson(jsonString);

import 'dart:convert';

CarNumberListModel carNumberListModelFromJson(String str) => CarNumberListModel.fromJson(json.decode(str));

String carNumberListModelToJson(CarNumberListModel data) => json.encode(data.toJson());

class CarNumberListModel {
  CarNumberListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory CarNumberListModel.fromJson(Map<String, dynamic> json) => CarNumberListModel(
    statusCode: json["statusCode"],
    code: json["code"],
    message: json["message"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "code": code,
    "message": message,
    "body": body!.toJson(),
  };
}

class Body {
  Body({
    this.carList,
  });

  List<CarList>? carList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    carList: List<CarList>.from(json["carList"].map((x) => CarList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "carList": List<dynamic>.from(carList!.map((x) => x.toJson())),
  };
}

class CarList {
  CarList({
    this.carNumber,
  });

  String? carNumber;

  factory CarList.fromJson(Map<String, dynamic> json) => CarList(
    carNumber: json["car_number"],
  );

  Map<String, dynamic> toJson() => {
    "car_number": carNumber,
  };
}
