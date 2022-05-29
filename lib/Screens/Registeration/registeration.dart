import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/LoginScreen/login_screen.dart';
import 'package:flyerapp/Screens/PreferedLocation/prefered_location.dart';
import '../../Constants/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

import '../Face Recognition/face_reco_registeration.dart';

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
                    Get.to(FaceRecoRegisteration());
                  },
                  child: CircleAvatar(
                    radius: 46,
                    backgroundColor: flyOrange3,
                    child: CircleAvatar(
                      radius: 43,
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white
                      ,child: Container(
                      height: H*0.12,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/registeration_prof_pic.png"),
                          )
                      ),
                    ),
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
                  child: Center(
                    child: DottedBorder(
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
                InkWell(
                  onTap: (){
                    registerUser();
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
  Future registerUser()async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;
    try{
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim())
          .then((value) {
        FirebaseFirestore.instance.collection("Users").doc(user?.uid).set(
            {
              "full_name" : fullNameController.text.trim(),
              "phone_number" : phoneController.text.trim(),
              "password" : passwordController.text.trim(),
              "confirm_password" : confirmPasswordController.text.trim()
            }
        );
      }).then(
              (value)
          {
            print("Created New Account");
            Get.to(PreferedLocation());
          }
      ).onError((error, stackTrace)
      {
        print("Error ${error.toString()}");
      });
    }catch(e)
    {
      print(e);
    }
  }
}
