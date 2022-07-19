import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart' as Path;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/progress_indicator.dart';
import '../HomePage/homepage.dart';
import '../LoginScreen/login_screen.dart';
import '../Registeration/registeration.dart';
import '../SharedPrefrence/sharedprefrence.dart';
import '../UserModel/user_model.dart';
import 'package:http_parser/http_parser.dart';


class AllApi {

  Future signUp(String fullName,email,password,confirmPassword,phoneNumber,File displayPicture,File drivingLicense) async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/signup";
    final bytes2 = Io.File(drivingLicense.path).readAsBytesSync();
    String base64File = base64.encode(bytes2);
    final bytes = Io.File(displayPicture.path).readAsBytesSync();
    String base64Image = base64.encode(bytes);
    var mapData = json.encode({
      "full_name" : fullName,
      "email": email,
      "password": password,
      "confirm_password" : confirmPassword,
      "phone_number" : phoneNumber,
      "display_picture" : "data:image/jpg;base64,$base64Image",
      "driving_license" : "data:application/pdf;base64,$base64File"
    });
    print("JSON DATA : ${mapData}");
    http.Response response = await http.post(Uri.parse(apiURL),
        headers: {"Content-Type": "application/json",'Accept': 'application/json',},
        body: mapData);
   try{
     if(response.statusCode == 200){
       var data = jsonDecode(response.body);
       Get.to(LoginScreen());
       print("DataForResponse: ${data}");
       print(response.statusCode);
       Fluttertoast.showToast(msg: "A Verification Email Sent To Your Email Id!");
     }else{
       var data = jsonDecode(response.body);
       print("Data: ${data}");
     }
   }catch(e){
     print(e.toString());
   }
  }

  Future loginUser(email, password) async {
    final response = await http.post(
        Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          "email": email,
          "password": password,
        }),
        encoding: Encoding.getByName('utf-8'));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        print('Data : ${data["data"]["data"]}');
        setId(data["data"]["data"]["_id"]);
        setName(data["data"]["data"]["full_name"]);
        setToken(data["data"]["token"]);
        setEmail(data["data"]["data"]["email"]);
        setDisplayPicture(data["data"]["data"]["display_picture"]);
        setPhoneNumber(data["data"]["data"]["phone_number"]);
        setPassword(data["data"]["data"]["password"]);
        setPassword(data["data"]["data"]["driving_license"]);
        Get.to(HomePage());
      } else {
        var data = jsonDecode(response.body);
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }


  Future uploadDisplayPicture(fullName,email,password,confirmPassword,phoneNumber,File displayPicture) async {

    // print('file ${drivingLicense.path}');
    // print('file ${displayPicture.path}');
    var stream = http.ByteStream(displayPicture.openRead());
    stream.cast();
    var length = await displayPicture.length();


    var request = http.MultipartRequest('POST', Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/signup",));
    String value1 = '';
    request.fields.addAll({
      "full_name" : fullName,
      "email": email,
      "password": password,
      "confirm_password" : confirmPassword,
      "phone_number" : phoneNumber,
    });
    request.fields['full_name'] = 'title';
    var multiPart = http.MultipartFile('display_picture',stream,length);
    request.files.add(multiPart);
    var response = await request.send();
    if(response.statusCode == 200){
      print('Image Uploaded');
      print('urlofpost = ${request.fields}');
    }else{
      print('fail');
    }
    

  }
  Future updateProfile(displayPicture) async {
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZDAwNmVhOWNkMDRlNjI4YzY1ZTAxZiIsImlhdCI6MTY1ODEyMDkwMiwiZXhwIjoxNjY4NDg4OTAyfQ.Psr3BtgjY5cHd_frdj_I7mQ3wpBqw8i1OkrXvC_QKkw";

    dio.FormData formData = dio.FormData.fromMap({
      "phone_number": 9872543210,
       "driving_license": "",
      "full_name": "Sarkar",
       "display_picture": await dio.MultipartFile.fromFile(displayPicture,
           filename: DateTime.now().microsecond.toString())
    });
    var dio1 = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'x-access-token': token,
        },
      ),
    );

    var response = await dio1.put(
      'https://nodeserver.mydevfactory.com:8087/distributor/profile',
      data: formData,
    );
    if (response.statusCode == 200) {
      var data = response.data;
      print(data);
    } else {
      var data = response.data;
      print(data);
    }
  }
}
