import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flyerapp/Screens/Forgot%20password/verify_otp.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return Scaffold(
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
        title: Text("Forgot Password"),
        titleTextStyle: TextStyle(
          fontFamily: "OpenSans-Semibold",
          fontSize: 22,
          color: Colors.black,

        ),
        titleSpacing: 2,

      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: H*0.08,),
              Container(
                  height: H*0.15,
                  child: Center(child: Image.asset("assets/images/enter_no.png"))),
              SizedBox(height: H*0.08,),
              Text("Enter your mobile number",
              style: TextStyle(
                fontFamily: "OpenSans-Bold",
                fontSize: 20,
                color: Colors.black,

              ),
              ),
              Text("You will get a OTP via SMS",
                style: TextStyle(
                  fontFamily: "OpenSans-Regular",
                  fontSize: 15,
                  color: Color(0xFF828282),
                ),
              ),
              SizedBox(height: H*0.07,),
              Container(
                  width: W*0.9,
                  height: H*0.08,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent,width: 0.5)
                  ),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: CountryCodePicker(
                            initialSelection: 'In',
                            showCountryOnly: true,
                          ),
                          suffixIcon: Image.asset("assets/images/smartphone.png"),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: flyGray4)
                          )
                      ),
                    ),
                  )),
              SizedBox(height: H*0.05,),
              InkWell(
                onTap: (){
                  Get.to(VerifyOTP());
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
                  Text("Send Verification Code",
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
          )
        ),
      ),
    );
  }
}
