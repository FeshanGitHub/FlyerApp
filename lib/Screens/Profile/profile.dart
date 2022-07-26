import 'dart:io';
import 'package:flyerapp/Screens/Profile/pdf_viewer.dart';
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/Forgot%20password/change_password.dart';
import 'package:flyerapp/Screens/HomePage/Deliveries/deliveries.dart';
import 'package:flyerapp/Screens/HomePage/Shipments/shipments.dart';
import 'package:flyerapp/Screens/Profile/edit_profile.dart';
import 'package:path_provider/path_provider.dart';
import '../../Constants/colors.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:get/get.dart';
import '../HomePage/Invite Friends/invite_friends.dart';
import '../HomePage/PreferedLocation/prefered_loca_edit.dart';
import '../LoginScreen/login_screen.dart';
import '../Payment/payment.dart';
import '../SharedPrefrence/sharedprefrence.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key,}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState(){
    getUserData();
    super.initState();
  }
  String? urlPdfPath;
  String? userNameAPI;
  String? userEmail;
  String? displayPicture;
  String? drivingLicense;
  String? phoneNumber;
  Future setUserData()async{
    userNameAPI = await setName('');
    userEmail = await setEmail('');
    displayPicture = await setDisplayPicture('');
    drivingLicense = await setDrivingLicense('');
    phoneNumber = await setPhoneNumber('');
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
      drivingLicense;
      phoneNumber;
    });
  }
  Future<File> getFileFromUrl(String url)async{
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return storeFile(url,bytes);
  }
  Future<File> storeFile(String url,List<int>bytes) async {
  final fileName = Path.basename(url);
  final dir =  await getApplicationDocumentsDirectory();
  final file = File("${dir.path}/$fileName");
  await file.writeAsBytes(bytes,flush: true);
  return file;
  }
  Future getUserData()async{
    userNameAPI = await getName();
    userEmail = await getEmail();
    displayPicture = await getDisplayPicture();
    drivingLicense = await getDrivingLicense();
    phoneNumber = await getPhoneNumber();
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
      drivingLicense;
      phoneNumber;
    });
  }
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F7F9),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: H*0.02,),
              Container(
                height: H*0.67,
                child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter
                          ,child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              boxShadow: [BoxShadow(
                                  offset: Offset(4,4),
                                  blurRadius: 5,
                                  color: flyGray4
                              )]
                          ),
                          height: H*0.6,
                          width: W*0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: H*0.1,),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft
                                      ,child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Name",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Color(0xFF606060)
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                        Text("Email",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Color(0xFF606060)
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                        Text("Contact",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Color(0xFF606060)
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                      ],
                                    ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight
                                      ,child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(":  $userNameAPI",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Colors.black
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                        Text(":  $userEmail",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Colors.black
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                        Text(":  $phoneNumber",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Colors.black
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                      ],
                                    ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: flyGray4,
                                ),
                                SizedBox(
                                  height: H*0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Documents",
                                      style: TextStyle(
                                          color: Color(0xFFAEAEAE),
                                          fontFamily: "Opensans-Semibold",
                                          fontSize: 20
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: H*0.02,
                                ),
                                Text("Driving Licence",
                                  style: TextStyle(
                                      color: Color(0xFFAEAEAE),
                                      fontFamily: "Opensans-Regular",
                                      fontSize: 16
                                  ),
                                ),
                                SizedBox(
                                    height: H*0.02
                                ),
                                Center(
                                  child: Column(
                                  children: [
                                    Text("$userNameAPI's Driving license",
                                  style: TextStyle(
                                      color: flyBlack2,
                                      fontFamily: "Opensans-Bold",
                                      fontSize: 16
                                  ),
                                ),
                                    SizedBox(height: H*0.02,),
                                    InkWell(
                                      onTap: ()async{
                                        final urlDrivingLicense = "$drivingLicense";
                                        print("URL : $urlDrivingLicense");
                                        final file = await getFileFromUrl(urlDrivingLicense);
                                        openPDF(file);
                                      print(drivingLicense);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: flyOrange2
                                        ),
                                        child: Text("View PDF",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Opensans-Bold",
                                              fontSize: 16
                                          ),
                                        ),
                                      ),
                                    )
                              ],
                            ),
                          )
                              ],
                            ),
                          ),
                        ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [BoxShadow(
                                    color: flyGray3,
                                    offset: Offset(2,2),
                                    blurRadius: 10,
                                  )]
                              ),
                              child: CircleAvatar(
                                radius: 52,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 43,
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white
                                  ,child: Container(
                                  height: H*0.12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage("$displayPicture"),
                                      )
                                  ),
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(height: H*0.03,),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Get.to(ChangePassword());
                  },
                  child: Container(
                    width: W*0.85,
                    height: H*0.08,
                    decoration: BoxDecoration(
                      color: flyGray5,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Center(child:
                    Text("Change Password",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 16,
                          color: flyBlack2
                      ),
                    )
                    ),
                  ),
                ),
              ),
              SizedBox(height: H*0.03,),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Get.to(EditProfile());
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
                    Text("Edit Profile",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Bold',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    )
                    ),
                  ),
                ),
              ),
              SizedBox(height: H*0.14,),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTextProfile(double W,String title,String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Opensans-Regular",
                color: Color(0xFF606060)
            )
        ),
        SizedBox(width: W*0.25,),
        Text(":",
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Opensans-Regular"
            )
        ),
        Text(subTitle,
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Opensans-Regular"
            )
        ),
      ],
    );
  }
  Container buildCardFlyer(double H, double W) {
    return Container(
      height: H*0.15,
      width: W*0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset("assets/images/flyer.png"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("  Flyer Distribution",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'OpenSans-Bold',
                    color: Color(0xFF333333)
                ),
              ),
              Row(
                children: [
                  Text("  Location :",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF808080)
                    ),
                  ),
                  Text(" Area 1, New Town, Kolkata ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF333333)
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  Text("  Pincode :",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF808080)
                    ),
                  ),
                  Text(" 700091 ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF333333)
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("  Date :",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF808080)
                    ),
                  ),
                  Text(" 17 May 2022 ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'OpenSans-Regular',
                        color: Color(0xFF333333)
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void openPDF(File file) => Get.to(PDFViewerPage(file: file,));
}