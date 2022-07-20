import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyerapp/Screens/Api/all_api.dart';
import 'package:flyerapp/Screens/LoginScreen/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import '../../Widgets/progress_indicator.dart';
import '../HomePage/PreferedLocation/prefered_location.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart' as dio;
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as Io;

import '../SharedPrefrence/sharedprefrence.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool hidePassword1 = true;
  bool hidePassword2 = true;
  bool checkBox = false;
  File? image;
  File? file;
  String? downloadUrl1;
  String? downloadUrl2;
  bool isLoading = false;
  String? userNameAPI;
  String? userEmail;
  String? displayPicture;
  String? drivingLicense;
  String? phoneNumber;
  String? password;
  String? tokenFromAPI;
  @override
  void initState(){
    getUserData();
    super.initState();
  }
  Future setUserData()async{
    tokenFromAPI = await setToken('');
    userNameAPI = await setName('');
    userEmail = await setEmail('');
    displayPicture = await setDisplayPicture('');
    drivingLicense = await setDrivingLicense('');
    phoneNumber = await setPhoneNumber('');
    password = await setPassword('');
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
      drivingLicense;
      phoneNumber;
      password;
      tokenFromAPI;
    });
  }

  Future getUserData()async{
    userNameAPI = await getName();
    userEmail = await getEmail();
    displayPicture = await getDisplayPicture();
    drivingLicense = await getDrivingLicense();
    phoneNumber = await getPhoneNumber();
    password = await getPassword();
    tokenFromAPI = await getToken();
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
      drivingLicense;
      phoneNumber;
      password;
      tokenFromAPI;
    });
  }

  @override
  Widget build(BuildContext context) {

    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: H*0.1,
                ),
                Text("Edit Your Profile",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: H*0.02,
                ),
                InkWell(
                  onTap: (){
                    Get.defaultDialog(
                        title: "Choose Option",
                        titleStyle: TextStyle(color: flyOrange2),
                        middleText: "",
                        content: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: H*0.01,bottom: H*0.009),
                              child: InkWell(
                                onTap: (){
                                  pickImage(ImageSource.camera);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.camera,color: flyOrange2,),
                                    Text(" Camera",
                                      style: TextStyle(
                                        fontFamily: "OpenSans-Regular",
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap:(){
                                pickImage(ImageSource.gallery);
                              },
                              child: Padding(
                                padding:  EdgeInsets.only(left: H*0.01,bottom: H*0.009),
                                child: Row(
                                  children: [
                                    Icon(Icons.photo,color: flyOrange2,),
                                    Text(" Gallery",
                                      style: TextStyle(
                                        fontFamily: "OpenSans-Regular",
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: H*0.01,bottom: H*0.009),
                              child: InkWell(
                                onTap: (){},
                                child: Row(
                                  children: [
                                    Icon(Icons.remove_circle,color: flyOrange2,),
                                    Text(" Remove",
                                      style: TextStyle(
                                        fontFamily: "OpenSans-Regular",
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                    );
                  },
                  child: CircleAvatar(
                    radius: 46,
                    backgroundColor: flyOrange3,
                    child: CircleAvatar(
                      radius: 43,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      backgroundImage: image != null ? FileImage(image!)  as ImageProvider : NetworkImage("$displayPicture"),
                    ),
                  ),
                ),
                SizedBox(
                  height: H*0.05,
                ),
                Container(
                    width: W*0.85,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: fullNameController..text = "$userNameAPI",
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Full Name"),
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans-Regular',
                                color: flyGray3
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: flyGray4)
                            )
                        ),
                      ),
                    )),
                SizedBox(
                  height: H*0.04,
                ),
                Container(
                    width: W*0.85,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: phoneController..text = "$phoneNumber",
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Phone Number"),
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans-Regular',
                                color: flyGray3
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: flyGray4)
                            )
                        ),
                      ),
                    )),
                SizedBox(
                  height: H*0.04,
                ),
                Container(
                    width: W*0.85,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: emailController..text = "$userEmail",
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            label: Text("Email"),
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontFamily: 'OpenSans-Regular',
                                color: flyGray3
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: flyGray4)
                            )
                        ),
                      ),
                    )),
                SizedBox(
                  height: H*0.04,
                ),
                InkWell(
                  onTap: (){
                    selectFile();
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: flyGray5
                    ),
                    child: Text(file == null ? "Upload New Driving License" : basename(file!.path),
                      style: TextStyle(
                          color: flyBlack,
                          fontFamily: "Opensans-Bold",
                          fontSize: 16,
                      ),
                    )
                  ),
                ),
                SizedBox(height: H*0.04,),
                 Container(
                  width: W*0.8,
                  height: H*0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: flyOrange2
                  ),
                  child: Center(child:
                  Text("Update",
                    style: TextStyle(
                        fontFamily: "Opensans-Bold",
                        fontSize: 16,
                        color: Colors.white
                    ),
                  )
                  ),
                ),
                SizedBox(height: H*0.06,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildUploadNoDotted(double H) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: H*0.025,
            child: Padding(
              padding:  EdgeInsets.only(right: Get.width*0.02),
              child: Image.asset("assets/images/upload_dl.png"),
            )),
        Text(basename(file!.path),
          style: TextStyle(
              fontSize: 13,
              fontFamily: 'OpenSans-Bold',
              color: flyBlack
          ),
        )
      ],
    );
  }

  DottedBorder buildDottedBorderRegister(double H, double W) {
    return DottedBorder(
      strokeWidth: 1,
      borderType: BorderType.RRect,
      radius: Radius.circular(8),
      dashPattern: [7,7],
      color: flyGray3,
      child: Container(
        height: H*0.1,
        width: W*0.65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: H*0.025,
                child: Image.asset("assets/images/upload_dl.png")),
            Text("  Upload Driving License",
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'OpenSans-Medium',
                  color: flyBlack
              ),
            )
          ],
        ),
      ),
    );
  }
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
    setState((){
      isLoading = true;
    });
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
        Get.to(LoginScreen());
        print("DataForResponse: ${data}");
        print(response.statusCode);
        Fluttertoast.showToast(msg: "A Verification Email Sent To Your Email Id!");
        setState((){
          isLoading = false;
        });
      }else{
        var data = jsonDecode(response.body);
        print("Data: ${data}");
      }
    }catch(e){
      print(e.toString());
    }
  }
  Future updateProfile(displayPicture) async {
    var token = "$tokenFromAPI";
    print(token);
    dio.FormData formData = dio.FormData.fromMap({
      "phone_number": phoneController.text.trim(),
      "driving_license": "",
      "full_name": "Sarkar",
      "display_picture": await dio.MultipartFile.fromFile(displayPicture,
          filename: DateTime.now().microsecond.toString())
    });
    var dio1 = dio.Dio(
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
  Future uploadImageCheck(String fullName,email,password,confirmPassword,phoneNumber)async{
    var bytes = File(image!.path).readAsBytesSync();
    String base64Image = base64Encode(bytes);
    print('upload proccess started');
    var apiPostData = json.encode({
      "full_name" : fullName,
      "email": email,
      "password": password,
      "confirm_password" : confirmPassword,
      "phone_number" : phoneNumber,
    });
    http.Response  response = await http.post(Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/signup"),body: apiPostData);
    if(response.statusCode == 200){
      print('successfull');
      print('JSON : ${response.body}');
    }else{
      print(base64Image);
      print(response.body);
      print('fail');
    }
  }

  Future uploadDisplayPicture(fullName,email,password,confirmPassword,phoneNumber) async {

    // print('file ${drivingLicense.path}');
    // print('file ${displayPicture.path}');
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();


    var request = http.MultipartRequest('POST',Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/signup",

    ));
    String value1 = '';
    request.fields.addAll({
      "full_name" : fullName,
      "email": email,
      "password": password,
      "confirm_password" : confirmPassword,
      "phone_number" : phoneNumber,
    });
    var multiPart = http.MultipartFile('display_picture',stream,length,filename: image!.path,);
    request.files.add(multiPart);
    var multiPart2 = http.MultipartFile('driving_license',stream,length,filename: file!.path,);
    request.files.add(multiPart2);
    var response = await request.send();
    if(response.statusCode == 200){

      print('Image Uploaded');
      print('urlofpost = ${request.fields}');
    }else{
      print(response.statusCode);
      print('fail');
      print(image!.path);
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
  Future<void> uploadImage()async{
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var uri = Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/signup");
    var request =  http.MultipartRequest('POST',uri);
    request.fields['full_name'] = 'title';
    var multiPart = http.MultipartFile('display_picture',stream,length);

    request.files.add(multiPart);
    var response = await request.send();

    if(response.statusCode == 200){
      print('Image Uploaded');
    }else{
      print('fail');
    }

    try{

    }catch(e){

    }
  }

  Future registerUser(BuildContext context)async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return ProgressDialog(message: "Please wait...",);
        }
    );
    {
      FirebaseFirestore.instance.collection("Google Users").doc(FirebaseAuth.instance.currentUser?.uid).set(
          {
            "full_name" : FirebaseAuth.instance.currentUser?.displayName,
            "email" : FirebaseAuth.instance.currentUser?.email,
            "phone_number" : phoneController.text.trim(),
            "password" : passwordController.text.trim(),
            "confirm_password" : confirmPasswordController.text.trim(),
            "id" : FirebaseAuth.instance.currentUser?.uid,
            "image" : FirebaseAuth.instance.currentUser?.photoURL,
            "driving_license" : downloadUrl1.toString()
          }
      );
      displayToastMessage("Congratulation, Your account has been created ", context);
      Get.to(PreferedLocation());
    }
  }
  Future uploadFile() async{
    String postId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('driving_license').child('post_$postId.jpg');
    await reference.putFile(file!);
    downloadUrl1 = await reference.getDownloadURL();
    return downloadUrl1;
  }

  Future selectFile()async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf']
    );
    if(result == null) return;
    final path = result.files.single.path!;
    setState((){
      file = File(path);
    });
  }

  Future pickImage(ImageSource source) async{
    try{
      final image = await ImagePicker().pickImage(source:source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState((){
        this.image = imageTemporary;
        Get.back();
      });
    }on PlatformException catch (e){
      print("Failed to pick image:$e");
    }
  }

  Future uploadPicture(BuildContext context) async{
    String postId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('images').child('post_$postId.jpg');
    await reference.putFile(file!);
    downloadUrl2 = await reference.getDownloadURL();
    return downloadUrl2;
  }

}

class FirebaseApi {
  static UploadTask? uploadFile(String destination,File file){
    try{
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);
    }on FirebaseException catch (e){
      return null;
    }
  }
}
class FirebaseApiForImage {
  static UploadTask? uploadFile(String destination,File image){
    try{
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(image);
    }on FirebaseException catch (e){
      return null;
    }
  }
}
showProgressBar(BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return ProgressDialog(message: "Please wait...",);
      }
  );
}
displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg: message);
}