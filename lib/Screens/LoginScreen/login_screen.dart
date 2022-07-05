import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Constants/colors.dart';
import 'package:flyerapp/Screens/Face%20Recognition/face_recognition.dart';
import 'package:flyerapp/Screens/Forgot%20password/forgot_password.dart';
import 'package:flyerapp/Screens/Google%20Sign%20In/google_sign_in.dart';
import 'package:flyerapp/Screens/HomePage/homepage.dart';
import 'package:flyerapp/Screens/Registeration/registeration.dart';
import 'package:flyerapp/main.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Widgets/progress_indicator.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email'
  ]
);
GoogleSignInAccount? currentUser;


class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(GoogleSignInControlller());
  @override
  void initState(){
    _googleSignIn.onCurrentUserChanged.listen((account) {
     setState((){
       currentUser = account;
     });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }
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
                SizedBox(height: H*0.06,),
                Text("Hey,",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: H*0.005,),
                Text("Sign IN Now",
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: H*0.03,),
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
                      onTap: (){
                     Get.to(SignUpPage());
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
                SizedBox(height: H*0.05,),
                Container(
                    width: W*0.85,
                    height: H*0.08,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "  Email",
                        hintStyle: TextStyle(
                            fontFamily: 'OpenSans-Regular',
                            color: flyGray3
                        ),
                        focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)
                        ),
                        enabledBorder: UnderlineInputBorder(
                         borderSide: BorderSide(color: Colors.transparent)
                        )
                      ),
                      ),
                    )),
                SizedBox(height: H*0.02,),
                Container(
                    width: W*0.85,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: passwordController,
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
                                borderSide: BorderSide(color: Colors.transparent)
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent)
                            )
                        ),
                      ),
                    )),
                SizedBox(height: H*0.04,),
                InkWell(
                  onTap: (){
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
                SizedBox(height: H*0.03),
                InkWell(
                  onTap: (){if(!emailController.text.contains('@'))
                  {
                    displayToastMessage("Email address is not valid", context);
                  }else if(passwordController.text.length < 6)
                  {
                    displayToastMessage("Password must be atleast 6 characters", context);
                  }else{
                    loginAndAuthenticateUser(context);
                  }
                  },
                  child: Container(
                    width: W*0.85,
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
                SizedBox(height: H*0.08),
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
                SizedBox(height: H*0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(FaceRecognition());
                      },
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white
                          ,child: Container(
                            height: H*0.035,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/face_recognition.png"),
                                )
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: W*0.03,),
                    InkWell(
                      onTap: (){
                        GoogleSignIn().signOut();
                      },
                      child: CircleAvatar(
                        radius: 31,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 30,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white
                          ,child: Container(
                          height: H*0.035,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/facebook.png")
                              )
                          ),
                        ),
                        ),
                      ),
                    ),
                    SizedBox(width: W*0.03,),
                    GetBuilder(
                      init: Get.find<GoogleSignInControlller>(),
                      builder: (GetxController loginController) {
                        return  InkWell(
                          onTap: (){
                            controller.googleLogin().whenComplete(() async{

                            });
                          },
                          child: CircleAvatar(
                            radius: 31,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 30,
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white
                              ,child: Container(
                              height: H*0.035,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/google.png")
                                  )
                              ),
                            ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: W*0.03,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return ProgressDialog(message: "  Authenticating,Please wait...",);
        }
    );
    User? user = (await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()).catchError(
            (errorMsg)
        {
          Navigator.pop(context);
          displayToastMessage("Error:" + errorMsg.toString(), context);
        }
    )).user;
    if(user != null){
      displayToastMessage("You are logged-in now", context);
      Get.off(SignUpPage());
    }else{
      Navigator.pop(context);
      displayToastMessage("message", context);
    }
  }
  void signOut(){
    _googleSignIn.disconnect();
  }
  Future<void> signIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(e){
      print("Error:$e");
    }
  }
}
