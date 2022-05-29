import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/LoginScreen/login_screen.dart';
import 'package:get/get.dart';

class SplashScreeen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
    child: InkWell(
        onTap: (){
          Get.to(LoginScreen());
        },
        child: Image.asset("assets/images/splash_screen.png")),
    ),
    );
  }
}
