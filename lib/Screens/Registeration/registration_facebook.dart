import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
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
class FacebookRegistration extends StatefulWidget {
  const FacebookRegistration({Key? key}) : super(key: key);

  @override
  State<FacebookRegistration> createState() => _FacebookRegistrationState();
}

class _FacebookRegistrationState extends State<FacebookRegistration> {
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


  @override
  Widget build(BuildContext context) {

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
                          readOnly: true,
                          controller: fullNameController..text = '${FirebaseAuth.instance.currentUser!.displayName}',
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
                          readOnly: true,
                          controller: emailController..text = '${FirebaseAuth.instance.currentUser!.email}',
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
                  checkBox == true ? InkWell(
                    onTap: () async {
                      // if(fullNameController.text.length < 3)
                      // {
                      //   displayToastMessage("Name must be atleast 3 characters", context);
                      // }
                      // else if(phoneController.text.length != 10 )
                      // {
                      //   displayToastMessage("Phone Number is not valid", context);
                      // }else if(passwordController.text.length < 6)
                      // {
                      //   displayToastMessage("Password must be atleast 6 characters", context);
                      // }else if(passwordController.text.length != confirmPasswordController.text.length)
                      // {
                      //   displayToastMessage("Password dose not match", context);
                      // }
                      // else if(file == null){
                      //   displayToastMessage("Please Upload Your Driving License", context);
                      // }
                      // else{
                      AllApi().signUp(
                          fullNameController.text.trim(),
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          confirmPasswordController.text.trim(),
                          phoneController.text.trim(),
                          image!,
                          file!
                      );
                      // registerUser(context);
                      // uploadFile();
                      // }
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
  Future signUp2() async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/signup";
    final bytes = Io.File(image!.path).readAsBytesSync();
    String base64Image = base64.encode(bytes);
    print("JSON DATA : ${base64Image}");
    http.Response response = await http.post(Uri.parse(apiURL),
        headers: {"Content-Type": "application/json",'Accept': 'application/json',},
        body: json.encode([
          {
            "full_name" : fullNameController.text,
            "email": emailController.text.trim(),
            "password": passwordController.text,
            "confirm_password" : confirmPasswordController.text,
            "phone_number" : phoneController.text,
            "display_picture": base64Image
          }
        ]),
        encoding: Encoding.getByName('utf-8'));

    var data = jsonDecode(response.body);
    print("Data: ${data}");
    // Get.to(LoginScreen());
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
displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg: message);
}