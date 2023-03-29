import 'dart:convert';

ProfileViewModel profileViewModelFromJson(String str) => ProfileViewModel.fromJson(json.decode(str));

String profileViewModelToJson(ProfileViewModel data) => json.encode(data.toJson());

class ProfileViewModel {
  ProfileViewModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  List<Body>? body;

  factory ProfileViewModel.fromJson(Map<String, dynamic> json) => ProfileViewModel(
    statusCode: json["statusCode"],
    code: json["code"],
    message: json["message"],
    body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "code": code,
    "message": message,
    "body": List<dynamic>.from(body!.map((x) => x.toJson())),
  };
}

class Body {
  Body({
    this.id,
    this.name,
    this.contact,
    this.password,
    this.adharFront,
    this.adharBack,
    this.pancard,
    this.passbook,
    this.rentalAgreement1,
    this.rentalAgreement2,
    this.reasons,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? contact;
  String? password;
  String? adharFront;
  String? adharBack;
  String? pancard;
  String? passbook;
  String? rentalAgreement1;
  String? rentalAgreement2;
  dynamic reasons;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    name: json["name"],
    contact: json["contact"],
    password: json["password"],
    adharFront: json["adhar_front"],
    adharBack: json["adhar_back"],
    pancard: json["pancard"],
    passbook: json["passbook"],
    rentalAgreement1: json["rental_agreement_1"],
    rentalAgreement2: json["rental_agreement_2"],
    reasons: json["reasons"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "contact": contact,
    "password": password,
    "adhar_front": adharFront,
    "adhar_back": adharBack,
    "pancard": pancard,
    "passbook": passbook,
    "rental_agreement_1": rentalAgreement1,
    "rental_agreement_2": rentalAgreement2,
    "reasons": reasons,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
