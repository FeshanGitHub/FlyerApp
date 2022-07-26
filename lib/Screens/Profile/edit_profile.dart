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
  String? drivingLicenseFromAPi;
  String? phoneNumber;
  String? password;
  String? tokenFromAPI;
  @override
  void initState(){
    super.initState();
    getUserData();
  }
  Future setUserData()async{
    tokenFromAPI = await setToken('');
    userNameAPI = await setName('');
    userEmail = await setEmail('');
    displayPicture = await setDisplayPicture('');
    drivingLicenseFromAPi = await setDrivingLicense('');
    phoneNumber = await setPhoneNumber('');
    password = await setPassword('');
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
      drivingLicenseFromAPi;
      phoneNumber;
      password;
      tokenFromAPI;
    });
  }

  Future getUserData()async{
    userNameAPI = await getName();
    userEmail = await getEmail();
    displayPicture = await getDisplayPicture();
    drivingLicenseFromAPi = await getDrivingLicense();
    phoneNumber = await getPhoneNumber();
    password = await getPassword();
    tokenFromAPI = await getToken();
    print("MyToken : $tokenFromAPI");
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
      drivingLicenseFromAPi;
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
                        controller: fullNameController,
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
                        // controller: phoneController..text = "$phoneNumber",
                        controller: phoneController,
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
                Text(file == null ? "$userNameAPI's Driving license" : basename(file!.path),
                  style: TextStyle(
                      color: flyBlack2,
                      fontFamily: "Opensans-Bold",
                      fontSize: 16
                  ),
                ),
                SizedBox(
                  height: H*0.02,
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
                    child: Text("Upload New Driving License",
                      style: TextStyle(
                          color: flyBlack,
                          fontFamily: "Opensans-Bold",
                          fontSize: 16,
                      ),
                    )
                  ),
                ),
                SizedBox(height: H*0.04,),
                 InkWell(
                   onTap: (){
                     updateProfile(
                       fullNameController.text.trim(),
                       phoneController.text.trim(),
                       file!,
                       image!
                     );
                   },
                   child: Container(
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
  Future updateProfile(String fullName,phoneNumber,File drivingLicense,File displayPicture) async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/profile";
    final bytes2 = Io.File(drivingLicense.path).readAsBytesSync();
    String base64File = base64.encode(bytes2);
    print("File: $base64File");
    final bytes = Io.File(displayPicture.path).readAsBytesSync();
    String base64Image = base64.encode(bytes);
    print("Image: $base64Image");
    var token = tokenFromAPI;
    var mapData = json.encode({
      "full_name" : fullName,
      "phone_number" : phoneNumber,
      "display_picture" : "data:image/jpg;base64,$base64Image",
      "driving_license" : "data:application/pdf;base64,$base64File"
    });
    print("JSON DATA : ${mapData}");
    http.Response response = await http.put(Uri.parse(apiURL),
        headers: {"Content-Type": "application/json",
                  'x-access-token': "$token",
                  'Accept': 'application/json',},
        body: mapData);
    setState((){
      isLoading = true;
    });
    try{
      if(response.statusCode == 200){
        var data = jsonDecode(response.body);
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
    if(result == null) return drivingLicenseFromAPi;
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
displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg: message);
}