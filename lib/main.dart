import 'package:flutter/material.dart';
import 'package:flyerapp/Constants/colors.dart';
import 'package:flyerapp/Screens/Face%20Recognition/face_reco_registeration.dart';
import 'package:flyerapp/Screens/Forgot%20password/change_password.dart';
import 'package:flyerapp/Screens/Forgot%20password/forgot_password.dart';
import 'package:flyerapp/Screens/Forgot%20password/reset_password.dart';
import 'package:flyerapp/Screens/Forgot%20password/verify_otp.dart';
import 'package:flyerapp/Screens/HomePage/Deliveries/deliveries.dart';
import 'package:flyerapp/Screens/HomePage/Help/help.dart';
import 'package:flyerapp/Screens/HomePage/Shipments/shipments.dart';
import 'package:flyerapp/Screens/Invite%20Friends/invite_friends.dart';
import 'package:flyerapp/Screens/Job%20Sheet/job_sheet.dart';
import 'package:flyerapp/Screens/JobSheetDetails/job_sheet_details.dart';
import 'package:flyerapp/Screens/LoginScreen/login_screen.dart';
import 'package:flyerapp/Screens/Notifications/notifications.dart';
import 'package:flyerapp/Screens/Payment/add_payment.dart';
import 'package:flyerapp/Screens/Prefered%20Location%20Edit/prefered_loca_edit.dart';
import 'package:flyerapp/Screens/Registeration/registeration.dart';
import 'package:flyerapp/Screens/SplashScreen/splash_screen.dart';
import 'package:flyerapp/Screens/Start%20Job/start_job.dart';
import 'Screens/Face Recognition/face_recognition.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/HomePage/homepage.dart';
import 'Screens/HomePage/homepage.dart';
import 'Screens/Job Details/job_details.dart';
import 'Screens/JobTracking/job_tracking.dart';
import 'Screens/PreferedLocation/prefered_location.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        unselectedWidgetColor: flyGray3,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
          )
        ),
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AddBankAccount(),
    );
  }
}
