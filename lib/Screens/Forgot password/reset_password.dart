import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool hidePassword1 = true;
  bool hidePassword2 = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back,color: Color(0xFF4D4D4D),))),
          title: Text("Reset Password"),
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans-Semibold",
            fontSize: 22,
            color: Colors.black,

          ),
          titleSpacing: 2,

        ),
        body: Center(
          child: Padding(
            padding:  EdgeInsets.only(left: H*0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: H*0.05,),
                Container(
                    width: W*0.9,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        obscureText: hidePassword1,
                        controller: newPasswordController,
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
                            label: Text("New Password"),
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
                SizedBox(height: H*0.02,),
                Container(
                    width: W*0.9,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        obscureText: hidePassword2,
                        controller: newConfirmController,
                        decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: (){
                                  setState((){
                                    hidePassword2 = !hidePassword2;
                                  });
                                },
                                child: hidePassword2 ?
                                Icon(Icons.visibility_outlined,color: flyGray3,) :
                                Icon(Icons.visibility_off,color: flyGray3,))
                            ,filled: true,
                            fillColor: Colors.white,
                            label: Text("Confirm New Password"),
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
                SizedBox(height: H*0.04,),
                Row(
                  children: [
                    Text("*",style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFFC7060B)
                    ),),
                    Text("Password should be at least 8 characters long.",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'OpenSans-Regular',
                          color: flyGray3
                      ),
                    ),
                  ],
                ),
                SizedBox(height: H*0.1,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: W*0.9,
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
                    Text("Submit",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
