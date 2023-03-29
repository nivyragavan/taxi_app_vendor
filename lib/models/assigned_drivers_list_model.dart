

import 'dart:convert';

AssignedDriversListModel assignedDriversListModelFromJson(String str) => AssignedDriversListModel.fromJson(json.decode(str));

String assignedDriversListModelToJson(AssignedDriversListModel data) => json.encode(data.toJson());

class AssignedDriversListModel {
  AssignedDriversListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory AssignedDriversListModel.fromJson(Map<String, dynamic> json) => AssignedDriversListModel(
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
    this.assignList,
  });

  List<AssignList>? assignList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    assignList: List<AssignList>.from(json["assignList"].map((x) => AssignList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "assignList": List<dynamic>.from(assignList!.map((x) => x.toJson())),
  };
}

class AssignList {
  AssignList({
    this.id,
    this.vendorId,
    this.carId,
    this.driverId,
    this.name,
    this.contact,
    this.licenseNumber,
    this.status,
    this.vendor,
    this.driver,
    this.car,
  });

  int? id;
  int? vendorId;
  int? carId;
  int? driverId;
  String? name;
  String? contact;
  String? licenseNumber;
  String? status;
  Driver? vendor;
  Driver? driver;
  Car? car;

  factory AssignList.fromJson(Map<String, dynamic> json) => AssignList(
    id: json["id"],
    vendorId: json["vendor_id"],
    carId: json["car_id"],
    driverId: json["driver_id"],
    name: json["name"],
    contact: json["contact"],
    licenseNumber: json["license_number"],
    status: json["status"],
    vendor: Driver.fromJson(json["vendor"]),
    driver: Driver.fromJson(json["driver"]),
    car: Car.fromJson(json["car"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "car_id": carId,
    "driver_id": driverId,
    "name": name,
    "contact": contact,
    "license_number": licenseNumber,
    "status": status,
    "vendor": vendor!.toJson(),
    "driver": driver!.toJson(),
    "car": car!.toJson(),
  };
}

class Car {
  Car({
    this.carNumber,
  });

  String? carNumber;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    carNumber: json["car_number"],
  );

  Map<String, dynamic> toJson() => {
    "car_number": carNumber,
  };
}

class Driver {
  Driver({
    this.name,
    this.contact,
  });

  String? name;
  String? contact;

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    name: json["name"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "contact": contact,
  };
}