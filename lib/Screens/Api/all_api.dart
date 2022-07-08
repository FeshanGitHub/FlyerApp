import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyerapp/Screens/UserModel/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../HomePage/homepage.dart';
import '../LoginScreen/login_screen.dart';


class AllApi {
  Future signIn(email,password) async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/login";
    Map mapData = {
      "email": email,
      "password": password
    };
    print("JSON DATA : ${mapData}");
    http.Response response = await http.post(Uri.parse(apiURL), body: mapData);

    var data = jsonDecode(response.body);
    print("Data: ${data}");
    Get.to(HomePage());
  }
  Future signUp( String fullName,email,password,confirmPassword,phoneNumber,displayPicture,drivingLicense) async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/signup";
    Map mapData = {
      "full_name" : fullName,
      "email": email,
      "password": password,
      "confirm_password" : confirmPassword,
      "phone_number" : phoneNumber,
      "driving_license" : drivingLicense,
      "display_picture" : displayPicture
    };
    print("JSON DATA : ${mapData}");
    http.Response response = await http.post(Uri.parse(apiURL), body: mapData);

    var data = jsonDecode(response.body);
    print("Data: ${data}");
    Get.to(LoginScreen());
  }

  Future<String?> uploadImage(filename,) async {
    var request = http.MultipartRequest('POST', Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/signup"));
    request.files.add(await http.MultipartFile.fromPath('picture', filename));
    var res = await request.send();
    return res.reasonPhrase;
  }

  // signUp(email,password)async{
  // var url = Uri.parse('https://nodeserver.mydevfactory.com:8087/distributor/login');
  // http.Response response = await http.post(url,
  // body:jsonEncode(<String,String>{
  //   'email' : email,
  //   'password' : password
  // })
  // );
  // print('token = ${response.body} ${response.statusCode}');
  // if (response.statusCode == 200)
  // {
  //   var body =  jsonDecode(response.body);
  //   print('body =$body');
  //   Get.snackbar('TOKEN', body['token']);
  // }
  // }

  // Future<Data1> fetchAlbum()async{
  //   final response = await http.get(Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/login"));
  //   if(response.statusCode == 200)
  //   {
  //     return Data1.fromJson(jsonDecode(response.body));
  //   } else
  //   {
  //     throw Exception('Failed to login');
  //   }
  // }
}