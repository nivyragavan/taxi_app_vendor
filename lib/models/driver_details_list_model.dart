

import 'dart:convert';

DriverDetailsListModel driverDetailsListModelFromJson(String str) => DriverDetailsListModel.fromJson(json.decode(str));

String driverDetailsListModelToJson(DriverDetailsListModel data) => json.encode(data.toJson());

class DriverDetailsListModel {
  DriverDetailsListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory DriverDetailsListModel.fromJson(Map<String, dynamic> json) => DriverDetailsListModel(
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
    this.driverList,
  });

  List<DriverList>? driverList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    driverList: List<DriverList>.from(json["driver_list"].map((x) => DriverList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "driver_list": List<dynamic>.from(driverList!.map((x) => x.toJson())),
  };
}

class DriverList {
  DriverList({
    this.name,
    this.contact,
  });

  String? name;
  String? contact;

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
    name: json["name"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contact": contact,
  };
}
