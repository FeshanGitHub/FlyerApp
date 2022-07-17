import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/Forgot%20password/change_password.dart';
import 'package:flyerapp/Screens/HomePage/Deliveries/deliveries.dart';
import 'package:flyerapp/Screens/HomePage/Shipments/shipments.dart';
import '../../Constants/colors.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:get/get.dart';
import '../HomePage/Invite Friends/invite_friends.dart';
import '../HomePage/PreferedLocation/prefered_loca_edit.dart';
import '../LoginScreen/login_screen.dart';
import '../Payment/payment.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key,}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                                        Text(":  Griffin Rox",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Colors.black
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                        Text(":  griffin@dummy.com",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "Opensans-Regular",
                                                color: Colors.black
                                            )
                                        ),
                                        SizedBox(height: H*0.02,),
                                        Text(":  +1 654 789 3210",
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    DottedBorder(
                                      strokeWidth: 2,
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(8),
                                      dashPattern: [7,7],
                                      color: flyGray3,
                                      child: Container(
                                        height: H*0.12,
                                        width: W*0.25,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF3F3F3),
                                            borderRadius: BorderRadius.all(Radius.circular(4))
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                height: H*0.04,
                                                child: Image.asset("assets/images/add.png")),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/registeration_prof_pic.png"),
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
                  onTap: (){},
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
}