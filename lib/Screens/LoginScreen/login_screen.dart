import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyerapp/Constants/colors.dart';
import 'package:flyerapp/Screens/Api/all_api.dart';
import 'package:flyerapp/Screens/Face%20Recognition/face_recognition.dart';
import 'package:flyerapp/Screens/Forgot%20password/forgot_password.dart';
import 'package:flyerapp/Screens/HomePage/homepage.dart';
import 'package:flyerapp/Screens/Registeration/registeration.dart';
import 'package:flyerapp/Screens/Registeration/registeration.dart';
import 'package:flyerapp/Screens/Registeration/registration_facebook.dart';
import 'package:flyerapp/Screens/Registeration/registration_google.dart';
import 'package:flyerapp/Screens/User/user.dart';
import 'package:flyerapp/main.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/progress_indicator.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController email  = TextEditingController();
TextEditingController password = TextEditingController();
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email'
  ]
);
GoogleSignInAccount? currentUser;
String userEmail = "";

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: H * 0.06,),
                Text("Hey,",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: H * 0.005,),
                Text("Sign IN Now",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: H * 0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you are new.",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Light',
                          fontSize: 17,
                          color: flyGray1
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(Registration());
                      },
                      child: Text(" Create New Account",
                        style: TextStyle(
                            fontFamily: 'OpenSans-Medium',
                            fontSize: 17,
                            color: Colors.blue.shade800
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: H * 0.05,),
                Container(
                    width: W * 0.85,
                    height: H * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        // validator: (value){
                        // if(value == null || value.isEmpty){
                        // return 'Enter your email address';
                        // }else if (RegExp(
                        //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        //     .hasMatch(value)) {
                        //   return null;
                        // }else{
                        //   return 'Please enter valid email address';
                        // }
                        // },
                        controller: email,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "  Email",
                            hintStyle: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                color: flyGray3
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent)
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent)
                            )
                        ),
                      ),
                    )),
                SizedBox(height: H * 0.02,),
                Container(
                    width: W * 0.85,
                    height: H * 0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "  Password",
                            hintStyle: TextStyle(
                                fontFamily: 'OpenSans-Regular',
                                color: flyGray3
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent)
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent)
                            )
                        ),
                      ),
                    )),
                SizedBox(height: H * 0.04,),
                InkWell(
                  onTap: () {
                    Get.to(ForgotPassword());
                  },
                  child: Text("Forgot Password?",
                    style: TextStyle
                      (
                        fontFamily: 'OpenSans-Medium',
                        fontSize: 16,
                        color: flyMargenta
                    ),
                  ),
                ),
                SizedBox(height: H * 0.03),
                loading
                    ? Center(
                    child: CircularProgressIndicator(color: flyOrange2,))
                    : InkWell(
                  onTap: () async {
                    if (!email.text.contains(RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
                      displayToastMessage(
                          "Email address is not valid", context);
                    } else if (password.text.length < 6) {
                      displayToastMessage(
                          "Password must be atleast 6 characters", context);
                    } else {
                      setState(() {
                        loading == true;
                        const CircularProgressIndicator(color: flyOrange2,);
                      });
                      print('clicked');
                      await AllApi().loginUser(email.text.trim(), password.text.trim());
                      setState((){
                        loading == false;
                      });
                      Get.to(HomePage());
                    }
                  },
                  child: Container(
                    width: W * 0.85,
                    height: H * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                            colors: [flyOrange1, flyOrange2],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight
                        )
                    ),
                    child: Center(child:
                    Text("Sign IN",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    )
                    ),
                  ),
                ),
                SizedBox(height: H * 0.08),
                Text("Or",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Light',
                      fontSize: 19,
                      color: Color(0xFFCBCBCB)
                  ),
                ),
                Text("Sign In with",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Regular',
                      fontSize: 18,
                      color: flyGray1
                  ),
                ),
                SizedBox(height: H * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()async {
                        await FirebaseAuth.instance.signOut();
                        userEmail = "";
                        await FacebookAuth.instance.logOut();
                        setState(() {

                        });
                        GoogleSignIn().signOut();
                      },
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white
                          , child: Container(
                          height: H * 0.035,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/face_recognition.png"),
                              )
                          ),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(width: W * 0.03,),
                    InkWell(
                      onTap: () {
                        signInWithFacebook();
                      },
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white
                          , child: Container(
                          height: H * 0.035,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/facebook.png")
                              )
                          ),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(width: W * 0.03,),
                    InkWell(
                      onTap: () {
                       googleLogin();
                      },
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white
                          , child: Container(
                          height: H * 0.035,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/google.png")
                              )
                          ),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(width: W * 0.03,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult = await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
      Get.to(GoogleSignInRegistration());

    } catch (error) {
      print(error);
    }
  }
  Future facebookLogin() async {
    print("FaceBook");
    try {
      final result =
      await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.i.getUserData();
        print(userData);
      }
    } catch (error) {
      print(error);
    }
  }
  Future <UserCredential> signInWithFacebook()async{
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email','public_profile','user_birthday']
    );

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);


    final userData = await FacebookAuth.instance.getUserData();
    print(userData);

    final userEmail = userData['email'];
    print(userEmail);
    if(loginResult.status == LoginStatus.success){
      Get.to(FacebookRegistration());
    }
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

  }

  Future signIn() async {
    var apiURL = "https://nodeserver.mydevfactory.com:8087/distributor/login";
    Map mapData = {
      "email": email.text.trim(),
      "password": password.text.trim()
    };
    print("JSON DATA : ${mapData}");
    http.Response response = await http.post(Uri.parse(apiURL), body: mapData);

    var data = jsonDecode(response.body);
    print("Data: ${data}");

    loading ? CircularProgressIndicator() : Get.to(HomePage());
  }

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void loginAndAuthenticateUser(BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "  Authenticating,Please wait...",);
        }
    );
    //   User? user = (await firebaseAuth.signInWithEmailAndPassword(
    //       email: email.text.trim(),
    //       password: password.text.trim()).catchError(
    //           (errorMsg)
    //       {
    //         Navigator.pop(context);
    //         displayToastMessage("Error:" + errorMsg.toString(), context);
    //       }
    //   )).user;
    //   if(user != null){
    //     displayToastMessage("You are logged-in now", context);
    //     Get.off(SignUpPage());
    //   }
    //   else{
    //     Navigator.pop(context);
    //     displayToastMessage("message", context);
    //   }
    // }
    // void signOut(){
    //   _googleSignIn.disconnect();
    // }
  }

  displayToastMessage(String message,BuildContext context){
    Fluttertoast.showToast(msg: message);
  }
}
