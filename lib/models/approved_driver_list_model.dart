// To parse this JSON data, do
//
//     final approvedDriverListModel = approvedDriverListModelFromJson(jsonString);

import 'dart:convert';

ApprovedDriverListModel approvedDriverListModelFromJson(String str) => ApprovedDriverListModel.fromJson(json.decode(str));

String approvedDriverListModelToJson(ApprovedDriverListModel data) => json.encode(data.toJson());

class ApprovedDriverListModel {
  ApprovedDriverListModel({
     this.statusCode,
     this.code,
     this.message,
     this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory ApprovedDriverListModel.fromJson(Map<String, dynamic> json) => ApprovedDriverListModel(
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
     this.driverapprovedvendorList,
  });

  List<DriverapprovedvendorList>? driverapprovedvendorList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    driverapprovedvendorList: List<DriverapprovedvendorList>.from(json["driverapprovedvendorList"].map((x) => DriverapprovedvendorList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "driverapprovedvendorList": List<dynamic>.from(driverapprovedvendorList!.map((x) => x.toJson())),
  };
}

class DriverapprovedvendorList {
  DriverapprovedvendorList({
     this.id,
     this.vendorId,
     this.name,
     this.contact,
     this.district,
     this.licenseNumber,
     this.expieryDate,
     this.profilePic,
     this.adharFront,
     this.adharBack,
     this.licenseFront,
     this.licenseBack,
    this.reasons,
     this.status,
  });

  int? id;
  int? vendorId;
  String? name;
  String? contact;
  String? district;
  String? licenseNumber;
  DateTime? expieryDate;
  String? profilePic;
  String? adharFront;
  String? adharBack;
  String? licenseFront;
  String? licenseBack;
  dynamic reasons;
  String? status;

  factory DriverapprovedvendorList.fromJson(Map<String, dynamic> json) => DriverapprovedvendorList(
    id: json["id"],
    vendorId: json["vendor_id"],
    name: json["name"],
    contact: json["contact"],
    district: json["district"],
    licenseNumber: json["license_number"],
    expieryDate: DateTime.parse(json["expiery_date"]),
    profilePic: json["profile_pic"],
    adharFront: json["adhar_front"],
    adharBack: json["adhar_back"],
    licenseFront: json["license_front"],
    licenseBack: json["license_back"],
    reasons: json["reasons"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vendor_id": vendorId,
    "name": name,
    "contact": contact,
    "district": district,
    "license_number": licenseNumber,
    "expiery_date": "${expieryDate!.year.toString().padLeft(4, '0')}-${expieryDate!.month.toString().padLeft(2, '0')}-${expieryDate!.day.toString().padLeft(2, '0')}",
    "profile_pic": profilePic,
    "adhar_front": adharFront,
    "adhar_back": adharBack,
    "license_front": licenseFront,
    "license_back": licenseBack,
    "reasons": reasons,
    "status": status,
  };
}
