import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
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
    

    // request.files.add(http.MultipartFile(
    //     'display_picture', displayPicture.readAsBytes().asStream(), displayPicture.lengthSync(),
    //     filename: basename(displayPicture.path)));
    // request.files.add(http.MultipartFile(
    //     'driving_license', drivingLicense.readAsBytes().asStream(), drivingLicense.lengthSync(),
    //     filename: basename(drivingLicense.path)));



    // await request.send().then((response) async {
    //
    //   print('response = ${response}');
    //
    //   if (response.statusCode == 200) {
    //     response.stream
    //         .transform(utf8.decoder)
    //         .listen((value) {})
    //         .onData((data) {
    //       value1 = data;
    //       print('MyData : $data');
    //     });
    //     return value1;
    //
    //   } else {
    //     value1 = "Error";
    //     print('MyData : ${response.statusCode} }');
    //
    //     return value1;
    //   }
    // });
    // return value1;
  }
  // var request = http.MultipartRequest('POST', Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/signup"));
  // request.files.add(http.MultipartFile(
  // 'file', file.readAsBytes().asStream(), file.lengthSync(),
  // filename: file.path));
  // await request.send().then((response) async {
  // if (response.statusCode == 200) {
  // response.stream
  //     .transform(utf8.decoder)
  //     .listen((value) {})
  //     .onData((data) {
  // value1 = data;
  // });
  // return value1;
  // } else {
  // value1 = "Error";
  // return value1;
  // }
  // });
  // return value1;
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