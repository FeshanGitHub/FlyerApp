import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
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
        title: Text("Verify OTP"),
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
                    child: Center(child: Image.asset("assets/images/verify_otp.png"))),
                SizedBox(height: H*0.08,),
                Text("Verification",
                  style: TextStyle(
                    fontFamily: "OpenSans-Bold",
                    fontSize: 20,
                    color: Colors.black,

                  ),
                ),
                Text("Code has been send to your mobile",
                  style: TextStyle(
                    fontFamily: "OpenSans-Regular",
                    fontSize: 15,
                    color: Color(0xFF828282),
                  ),
                ),
                SizedBox(height: H*0.07,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildTextFormOTP(W, H),
                    buildTextFormOTP(W, H),
                    buildTextFormOTP(W, H),
                    buildTextFormOTP(W, H),
                  ],
                ),
                SizedBox(height: H*0.05,),
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
                    Text("Next",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    )
                    ),
                  ),
                ),
                SizedBox(height: H*0.08,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Resend OTP  ",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Semibold',
                          fontSize: 16,
                          color: Color(0xFF929292)
                      ),
                    ),
                    Container(
                        height: H*0.028,
                        width: W*0.07,
                        child: Image.asset("assets/images/orange_arrow_frnt.png",)),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }

  Container buildTextFormOTP(double W, double H) {
    return Container(
                    width: W*0.18,
                    height: H*0.08,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent,width: 0.5)
                    ),
                    child: Center(
                      child: TextFormField(
                        onChanged: (value){
                          if(value.length == 1){
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
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
                    ));
  }
}
