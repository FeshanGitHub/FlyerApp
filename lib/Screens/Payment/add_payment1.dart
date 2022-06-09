import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';

class AddBankAccount1 extends StatefulWidget {
  const AddBankAccount1({Key? key}) : super(key: key);

  @override
  State<AddBankAccount1> createState() => _AddBankAccount1State();
}

class _AddBankAccount1State extends State<AddBankAccount1> {
  bool hidePassword1 = true;
  bool hidePassword2 = true;
  bool hidePassword3 = true;
  TextEditingController passwordController = TextEditingController();
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
          title: Text("Add Bank Account"),
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans-Semibold",
            fontSize: 22,
            color: Colors.black,

          ),
          titleSpacing: 2,

        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.only(left: H*0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: H*0.05,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Add New Bank Detail",
                      style: TextStyle(
                          fontFamily: 'Gothic-Regular',
                          fontSize: 18,
                          color: Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: H*0.02,),
                  Container(
                      width: W*0.9,
                      height: H*0.08,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent,width: 0.5)
                      ),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Account Holder Name"),
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
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("Account Number"),
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
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: Text("IFSC Code"),
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
                  SizedBox(height: H*0.15,),
                  InkWell(
                    onTap: (){
                      Get.back();
                    },
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
                  SizedBox(height: H*0.04,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
