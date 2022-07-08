import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyerapp/Screens/HomePage/homepage.dart';
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
import 'package:http/http.dart' as http;



class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool hidePassword1 = true;
  bool hidePassword2 = true;
  bool checkBox = false;
  final formKey = GlobalKey<FormState>();
  File? image;
  File? file;
  String? downloadUrl1;
  String? downloadUrl2;
  Future signUp() async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/signup";
    // Map mapData = {
    //   "email": emailController.text.trim(),
    //   "full_name": fullNameController.text.trim(),
    //   "password": passwordController.text.trim(),
    //   "confirm_password": confirmPasswordController.text.trim(),
    //   "phone_number": phoneController.text.trim()
    // };
    Map mapData = {
      "email": "khanfeshan2324@gnmail.com",
      "full_name": "feshan",
      "password": "qwerty",
      "confirm_password": "qwerty",
      "phone_number": "9930389046"
    };
    print("JSON DATA : ${mapData}");
    http.Response response = await http.post(Uri.parse(apiURL), body: mapData);
    var data = jsonDecode(response.body);
    print("Data: ${data}");
    Get.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    signUp();
    final fileName = file != null ? basename(file!.path) : printError(info: 'No file selected');
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: H*0.1,
                  ),
                  Text("Create New Account",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(
                    height: H*0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("If you are already registered.",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Light',
                            fontSize: 18,
                            color: flyGray1
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(LoginScreen());
                        },
                        child: Text(" Sign In",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Medium',
                              fontSize: 18,
                              color: flyBlue2
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: H*0.03,
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
                        backgroundImage: image != null ? FileImage(image!)  as ImageProvider : AssetImage("assets/images/registeration_prof_pic.png"),
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
                  Container(
                      width: W*0.85,
                      height: H*0.08,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent,width: 0.5)
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: emailController,
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
                  Container(
                      width: W*0.85,
                      height: H*0.08,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent,width: 0.5)
                      ),
                      child: Center(
                        child: TextFormField(
                          obscureText: hidePassword1,
                          controller: passwordController,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: (){
                                 setState((){
                                   hidePassword1 = !hidePassword1;
                                 });
                                  },
                                  child: hidePassword1 ?
                                  Icon(Icons.visibility_outlined,color: flyGray3,) :
                                  Icon(Icons.visibility_off,color: flyGray3,))
                              ,filled: true,
                              fillColor: Colors.white,
                              label: Text("Password"),
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
                          obscureText: hidePassword2,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: (){
                                    setState((){
                                      hidePassword2 = !hidePassword2;
                                    });
                                  },
                                  child: hidePassword2 ?
                                  Icon(Icons.visibility_outlined,color: flyGray3,) :
                                  Icon(Icons.visibility_off,color: flyGray3,) )
                              ,filled: true,
                              fillColor: Colors.white,
                              label: Text("Confirm Password"),
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
                    height: H*0.02,
                  ),
                  Container(
                    height: H*0.14,
                    width: W*0.85,
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        offset: Offset(0,2),
                        color: flyGray4
                      )],
                      color: flyWhite,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: flyGray4,)
                    ),
                    child: InkWell(
                      onTap: (){
                        selectFile();
                      },
                      child: Center(
                        child: file == null ? buildDottedBorderRegister(H, W) : buildUploadNoDotted(H),
                      ),
                    ),
                  ),
                  SizedBox(height: H*0.02,),
                  Padding(
                    padding:  EdgeInsets.only(left: W*0.04),
                    child: Row(
                      children: [
                        Checkbox(value: checkBox,
                            checkColor: Colors.white,
                            activeColor: flyOrange2,
                            onChanged: (value)
                        {
                          setState((){
                            checkBox = value!;
                          });
                        })
                        ,Text("I Agree To",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Light',
                            shadows: [Shadow(
                                color: flyGray3
                                ,offset: Offset(1.2,1.2)
                            )],
                          fontSize: 13,
                          color: flyBlack
                        ),
                        ),
                        Text(" Terms & Conditions.",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Medium',
                              shadows: [Shadow(
                                color: flyGray3
                                ,offset: Offset(1.5,1.5)
                              )],
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: flyBlack
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: H*0.02,),
                  checkBox == true  ? InkWell(
                    onTap: (){
                      if(fullNameController.text.length < 3)
                      {
                        displayToastMessage("Name must be atleast 3 characters", context);
                      }else if(!emailController.text.contains('@'))
                      {
                        displayToastMessage("Email address is not valid", context);
                      }else if(phoneController.text.length != 10 )
                      {
                        displayToastMessage("Phone Number is not valid", context);
                      }else if(passwordController.text.length < 6)
                      {
                        displayToastMessage("Password must be atleast 6 characters", context);
                      }else if(passwordController.text.length != confirmPasswordController.text.length)
                      {
                        displayToastMessage("Password dose not match", context);
                      }
                      // else if(image == null){
                      //   displayToastMessage("Please Upload Your Profile Picture", context);
                      // }else if(file == null){
                      //   displayToastMessage("Please Upload Your Driving License", context);
                      // }
                      else{
                        signUp();
                        uploadPicture(context);
                        uploadFile();
                      }
                    },
                    child: Container(
                      width: W*0.8,
                      height: H*0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
                              colors: [flyOrange1,flyOrange2],
                              begin: Alignment.bottomLeft,
                              end:  Alignment.topRight
                          )
                      ),
                      child: Center(child:
                      Text("Next",
                        style: TextStyle(
                            fontFamily: "Opensans-Bold",
                            fontSize: 16,
                            color: Colors.white
                        ),
                      )
                      ),
                    ),
                  ) : Container(
                    width: W*0.8,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: flyGray3
                    ),
                    child: Center(child:
                    Text("Next",
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
      ),
    );
  }

  Row buildUploadNoDotted(double H) {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: H*0.025,
                              child: Image.asset("assets/images/upload_dl.png")),
                          Text("  Driving License Uploaded",
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
  // Future signUp() async {
  //   var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/login";
  //   Map mapData = {
  //     "email": emailController.text.trim(),
  //     "password": passwordController.text.trim(),
  //     "confirm_password":confirmPasswordController.text.trim(),
  //     "phone_number" : phoneController.text.trim(),
  //     "driving_license" :
  //   };
  //   print("JSON DATA : ${mapData}");
  //   http.Response response = await http.post(Uri.parse(apiURL), body: mapData);
  //
  //   var data = jsonDecode(response.body);
  //   print("Data: ${data}");
  //
  //   Get.to(HomePage());
  // }
  Future registerUser(BuildContext context)async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return ProgressDialog(message: "Please wait...",);
        }
    );
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()).catchError(
            (errorMsg)
        {
          displayToastMessage("Error:" + errorMsg.toString(), context);
        }
    )).user;
    if(user != null)
    {
      FirebaseFirestore.instance.collection("Users").doc(user.uid).set(
          {
            "full_name" : fullNameController.text.trim(),
            "email" : emailController.text.trim(),
            "phone_number" : phoneController.text.trim(),
            "password" : passwordController.text.trim(),
            "confirm_password" : confirmPasswordController.text.trim(),
            "id" : user.uid,
            "image" : downloadUrl2.toString(),
            "driving_license" : downloadUrl1.toString()
          }
      );
      displayToastMessage("Congratulation, Your account has been created ", context);
      Get.to(PreferedLocation());
    }else
    {
      displayToastMessage("User has not been created", context);
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
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
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

displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg: message);
}