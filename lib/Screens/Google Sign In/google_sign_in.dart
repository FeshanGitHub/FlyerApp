import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/HomePage/homepage.dart';
import 'package:flyerapp/Screens/Registeration/registeration.dart';
import 'package:flyerapp/Screens/Registeration/registeration_google.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInControlller extends GetxController{
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
   Get.to(SignUpPageGoogle());

  } catch (error) {
   print(error);
  }
 }


 Future<void> logout() async {
  await GoogleSignIn().disconnect();
  FirebaseAuth.instance.signOut();
 }
 }
