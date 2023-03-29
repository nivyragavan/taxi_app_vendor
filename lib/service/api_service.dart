import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:viswa_cab_vendor_app/models/assigned_drivers_list_model.dart';
import '../constants/api.dart';
import '../models/approved_car_list_model.dart';
import '../models/approved_driver_list_model.dart';
import '../models/car_number_list_model.dart';
import '../models/driver_details_list_model.dart';
import '../models/profile_view_model.dart';

class ApiService {

  final box = GetStorage();

  Future vendorRegister(String name, contact, password, File? imageFile1,
      imageFile2, imageFile3, imageFile4, imageFile5, imageFile6) async {

    var completeUrl = ApiConstants.baseUrl + ApiConstants.vendorRegister;
    print('Api ===== $completeUrl');
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
        "aadharFront", imageFile1?.path ?? '');
    http.MultipartFile multipartFile2 =
    await http.MultipartFile.fromPath("aadharBack", imageFile2?.path ?? '');
    http.MultipartFile multipartFile3 =
    await http.MultipartFile.fromPath("pancard", imageFile3?.path ?? '');
    if (imageFile4?.path != null &&
        imageFile5?.path != null &&
        imageFile6?.path != null) {
      if (imageFile4?.path.isNotEmpty &&
          imageFile5?.path.isNotEmpty &&
          imageFile6?.path.isNotEmpty) {
        http.MultipartFile multipartFile4 = await http.MultipartFile.fromPath(
            "passbook", imageFile4?.path ?? '');
        request.files.add(multipartFile4);
        http.MultipartFile multipartFile5 = await http.MultipartFile.fromPath(
            "agreement1", imageFile5?.path ?? '');
        request.files.add(multipartFile5);
        http.MultipartFile multipartFile6 = await http.MultipartFile.fromPath(
            "agreement2", imageFile6?.path ?? '');
        request.files.add(multipartFile6);
      }
    }
    request.fields["name"] = name;
    request.fields["contact"] = contact;
    request.fields["password"] = password;
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future vendorLogin(String contact, password) async{
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.vendorLogin;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri, body: {
      "contact" : contact,
      "password" : password
    });
    if(response.statusCode == 200){
      print(response.body.toString());
      var convertedDataToJson = jsonDecode(response.body);
      return convertedDataToJson;
    }
  }

  Future driverRegister(String name, contact, district,license,date, File? imageFile1,
      imageFile2, imageFile3, imageFile4, imageFile5) async {
    var vendorId = box.read("vendorId");
    var completeUrl = ApiConstants.baseUrl + ApiConstants.driverRegister;
    print('Api ===== $completeUrl');
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
        "profilePic", imageFile1?.path ?? '');
    http.MultipartFile multipartFile2 =
    await http.MultipartFile.fromPath("aadharFront", imageFile2?.path ?? '');
    http.MultipartFile multipartFile3 =
    await http.MultipartFile.fromPath("aadharBack", imageFile3?.path ?? '');
    http.MultipartFile multipartFile4 = await http.MultipartFile.fromPath(
        "licenseFront", imageFile4?.path ?? '');
    http.MultipartFile multipartFile5 =
    await http.MultipartFile.fromPath("licenseBack", imageFile5?.path ?? '');
    request.fields["vendorId"] = "$vendorId";
    request.fields["name"] = name;
    request.fields["contact"] = contact;
    request.fields["district"] = district;
    request.fields["licensenumber"] = license;
    request.fields["expirydate"] = date;
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    request.files.add(multipartFile4);
    request.files.add(multipartFile5);
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future carRegister(String carNumber, model, File? imageFile1,
      imageFile2, imageFile3, imageFile4, imageFile5, imageFile6) async {
    var vendorId = box.read('vendorId');
    var completeUrl = ApiConstants.baseUrl + ApiConstants.carRegister;
    var request = http.MultipartRequest('POST', Uri.parse(completeUrl));
    http.MultipartFile multipartFile1 =
    await http.MultipartFile.fromPath("frontPic", imageFile1?.path ?? '');
    http.MultipartFile multipartFile2 = await http.MultipartFile.fromPath(
        "chasisPic", imageFile2?.path ?? '');
    http.MultipartFile multipartFile3 =
    await http.MultipartFile.fromPath("rcFront", imageFile3?.path ?? '');
    http.MultipartFile multipartFile4 =
    await http.MultipartFile.fromPath("rcBack", imageFile4?.path ?? '');
    http.MultipartFile multipartFile5 =
    await http.MultipartFile.fromPath("insurance", imageFile5?.path ?? '');
    if (imageFile6?.path != null) {
      if (imageFile6?.path.isNotEmpty) {
        http.MultipartFile multipartFile6 =
        await http.MultipartFile.fromPath("fc", imageFile6?.path ?? '');
        request.files.add(multipartFile6);
      }
    }
    request.fields["vendorId"] = '$vendorId';
    request.fields["carNumber"] = carNumber;
    request.fields["model"] = model;
    request.files.add(multipartFile1);
    request.files.add(multipartFile2);
    request.files.add(multipartFile3);
    request.files.add(multipartFile4);
    request.files.add(multipartFile5);
    var res = await request.send();
    String result = await res.stream.bytesToString();
    print(result);
    print(res);
    var convertedDataToJson = jsonDecode(result);
    print("result =$convertedDataToJson");
    return convertedDataToJson;
  }

  Future<ApprovedDriverListModel?> approvedDriverList() async{
    var vendorId = box.read('vendorId');
    var params = {'vendorId': '$vendorId'};
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.ApprovedDriversList;
    var uri = Uri.parse(completeUrl);
    var finalUri = uri.replace(queryParameters:params);
    final response = await client.get(finalUri);
    if(response.statusCode == 200){
      print('vendorId:$vendorId');
      print(response.body.toString());
      var json = response.body;
      return approvedDriverListModelFromJson(json);
    }
    return null;
  }

  Future<ApprovedCarListModel?> approvedCarList() async{
    var vendorId = box.read('vendorId');
    var params = {'vendorId': '$vendorId'};
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.ApprovedCarsList;
    var uri = Uri.parse(completeUrl);
    var finalUri = uri.replace(queryParameters:params);
    final response = await client.get(finalUri);
    if(response.statusCode == 200){
      print('vendorId:$vendorId');
      print(response.body.toString());
      var json = response.body;
      return approvedCarListModelFromJson(json);
    }
    return null;
  }
  
  Future<CarNumberListModel?> carNumberList() async {
    var vendorId = box.read('vendorId');
    var params = {'vendorId':'$vendorId'};
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.carNumberListModel;
    var uri = Uri.parse(completeUrl);
    var finalUri = uri.replace(queryParameters:params);
    final response = await client.get(finalUri);
    if(response.statusCode == 200){
      print('vendorId:$vendorId');
      print(response.body.toString());
      var json = response.body;
      return carNumberListModelFromJson(json);
    }
    return null;
  }

  Future<DriverDetailsListModel?> driverDetailsList() async {
    var vendorId = box.read('vendorId');
    var params = {'vendorId':'$vendorId'};
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.driverDetailsListModel;
    var uri = Uri.parse(completeUrl);
    var finalUri = uri.replace(queryParameters:params);
    final response = await client.get(finalUri);
    if(response.statusCode == 200){
      print('vendorId:$vendorId');
      print(response.body.toString());
      var json = response.body;
      return driverDetailsListModelFromJson(json);
    }
    return null;
  }

  Future assignDriver(String carNumber, name, contact) async {
    var vendorId = box.read('vendorId');
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.assignDriver;
    var uri = Uri.parse(completeUrl);
    final response = await client.post(uri,body: {
      'vendorId' : '$vendorId',
      'carNumber' : carNumber,
      'name' : name,
      'contact' : contact
    });
    if(response.statusCode == 200){
      var convertedDataFromJson = jsonDecode(response.body);
      print(convertedDataFromJson);
      return convertedDataFromJson;
    }
  }

  Future<ProfileViewModel?> profileView() async {
    var vendorId = box.read('vendorId');
    var params = {'vendorId':'$vendorId'};
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.profileView;
    var uri = Uri.parse(completeUrl);
    var finalUri = uri.replace(queryParameters:params);
    final response = await client.get(finalUri);
    if(response.statusCode == 200){
      print('vendorId:$vendorId');
      print(response.body.toString());
      var json = response.body;
      return profileViewModelFromJson(json);
    }
    return null;
  }

  Future<AssignedDriversListModel?> assignedDriversList() async {
    var vendorId = box.read('vendorId');
    var params = {'vendorId':'$vendorId'};
    var client = http.Client();
    var completeUrl = ApiConstants.baseUrl + ApiConstants.assignedDriversList;
    var uri = Uri.parse(completeUrl);
    var finalUri = uri.replace(queryParameters:params);
    final response = await client.get(finalUri);
    if(response.statusCode == 200){
      print('vendorId:$vendorId');
      print(response.body.toString());
      var json = response.body;
      return assignedDriversListModelFromJson(json);
    }
    return null;
  }
}
