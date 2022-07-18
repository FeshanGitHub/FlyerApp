import 'dart:convert';

import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyerapp/Screens/HomePage/Deliveries/deliveries.dart';
import 'package:flyerapp/Screens/HomePage/HomePage/homepage_main.dart';
import 'package:flyerapp/Screens/HomePage/Invite%20Friends/invite_friends.dart';
import 'package:flyerapp/Screens/HomePage/PreferedLocation/prefered_loca_edit.dart';
import 'package:flyerapp/Screens/HomePage/Shipments/shipments.dart';
import 'package:flyerapp/Screens/Job%20Sheet/job_sheet.dart';
import 'package:flyerapp/Screens/LoginScreen/login_screen.dart';
import 'package:flyerapp/Screens/Notifications/notifications.dart';
import 'package:flyerapp/Screens/Payment/payment.dart';
import 'package:flyerapp/Screens/Profile/profile.dart';
import 'package:flyerapp/Screens/Registeration/registeration.dart';
import '../../Constants/colors.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:get/get.dart';
import '../Job Details/job_details.dart';
import 'package:http/http.dart' as http;

import '../SharedPrefrence/sharedprefrence.dart';
import '../UserModel/user_model.dart';
import 'Help/help.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState(){
    getData();
    getUserData();
    super.initState();
  }
  String? userNameAPI;
  String? userEmail;
  String? displayPicture;
  Future setUserData()async{
    userNameAPI = await setName('');
    userEmail = await setEmail('');
    displayPicture = await setDisplayPicture('');
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
    });
  }

  Future getUserData()async{
    userNameAPI = await getName();
    userEmail = await getEmail();
    displayPicture = await getDisplayPicture();
    setState((){
      userNameAPI;
      userEmail;
      displayPicture;
    });
  }
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = "";
  String email = "";
  String image = "";
  Future<void> getData() async {
    User? user = firebaseAuth.currentUser;
    final DocumentSnapshot userData = await FirebaseFirestore.instance.collection('Users').doc(user?.uid).get();
    setState((){
      name = userData.get('full_name');
      email = userData.get('email');
      image = userData.get('image');
    });
  }
  GlobalKey<ScaffoldState> scaffoldKey =GlobalKey<ScaffoldState>();
  GlobalKey bottomNavigationKey = GlobalKey();
  var selectedCard = 'Deliveries';
  var selectedIndex = 0;
  int _currentIndex = 0;

   var screens = [
     HomePageMain(),
     JobSheet(),
     Profile()
   ];
  var homePages = [
    Deliveries(),
    PreferedLocaEdit(),
    Shipments(),
    Payment(),
    Help(),
    InviteFriends()
  ];
  final tabs =[
    HomePageMain(),
    JobSheet(),
    Profile()
  ];
  // Future apiCallLoginData()async{
  //   http.Response response;
  //   response = await http.get(Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/login"));
  //   if(response.statusCode == 200){
  //     setState((){
  //       var stringRespone = response.body.length;
  //       print(stringRespone);
  //     });
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    late CollectionReference userData = FirebaseFirestore.instance.collection("Users");
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFF6F7F9),
        key: scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: flyOrange2,
          unselectedItemColor: Color(0xFF4D4D4D),
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home",),
            BottomNavigationBarItem(icon: Icon(Icons.cases_rounded),label:"Job Sheet",),
            BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile",)
          ],
          selectedLabelStyle:  TextStyle(fontFamily: 'Roboto-Regular',color: Color(0xFF4D4D4D)),
          onTap: (index){
            setState((){
              _currentIndex = index;
            });
          },
        ),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F7F9),
        elevation: 0,
        leading: InkWell(
          onTap: (){
          scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
              child: Image.asset("assets/images/drawer.png")),
        ),
        actions: [InkWell(
          onTap: (){
            Get.to(Notifications());
          },
          child: Padding(
              padding:  EdgeInsets.only(right: W*0.04),
              child: Center(
                child: Stack(
                  children: [
                    Icon(Icons.notifications_none_outlined,color: flyBlack2,),
                    Padding(
                      padding:  EdgeInsets.only(left: W*0.03,),
                      child: CircleAvatar(
                        backgroundColor: flyOrange2,
                        radius: 7,
                        child: Text("3",style: TextStyle(
                            fontSize: 11
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            ),
        )],
      ),
        drawer: Drawer(
          child: Card(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Builder(
                        builder: (BuildContext context) { return IconButton(
                          icon: Image.asset("assets/images/closed_drawer.png"),
                          onPressed: () {
                            return Scaffold.of(context).closeDrawer();
                          },
                        ); },
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: W*0.015),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: flyOrange3,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:  NetworkImage(displayPicture!)
                                )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: W*0.05,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userNameAPI!,
                              style: TextStyle(
                                fontFamily: "Roboto-Medium",
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                            Text(userEmail!,
                              style: TextStyle(
                                  fontFamily: "Gothic-Regular",
                                  fontSize: 13,
                                  color: Color(0xFFA8A8A8)
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: H*0.01,),
                  Container(
                    padding: EdgeInsets.only(right: W*0.06),
                    child: Divider(
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                  buildDrawerCard(H,"assets/images/deliveries.png","  Deliveries",0),
                  buildDrawerCard(H,"assets/images/prefered_location.png","  Prefered Location",1),
                  buildDrawerCard(H,"assets/images/shipments.png","  Shipments",2),
                  buildDrawerCard(H,"assets/images/payments.png","  Payments",3),
                  buildDrawerCard(H,"assets/images/help.png","  Help",4),
                  buildDrawerCard(H,"assets/images/invite.png","  Invite",5),
                  buildDrawerCard(H,"assets/images/logout.png","  Logout",6),
                ],
              ),
            ),
          ),
        ),
        body: tabs[_currentIndex],
      ),
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
  InkWell buildDrawerCard(double H,String image,String name ,index) {
    return InkWell(
                  onTap: (){
                    setState((){
                    selectedCard = name;
                    selectedIndex = index;
                    selectedItem(context,index);
                    });
                  },
                  child: Card(
                    elevation: 0,
                  color: selectedCard == name ? flyOrange2 : Colors.white,
                  child: Container(
                   padding: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: Color(0xFFD6D6D6),
                        child: CircleAvatar(
                          radius: 22,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white
                          ,child: Center(
                          child: Container(
                            height: H*0.027,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(image),
                                )
                            ),
                          ),
                        ),
                        ),
                      ),
                      selectedCard == name ?
                      Text(  name,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ):
                      Text(  name,
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                    ],
                  ),
                  ),
                  ),
                );
  }
   selectedItem(BuildContext context, int index) {
    switch(index){
      case 0:
        Get.to(Deliveries());
    }
    switch(index){
      case 1:
        Get.to(PreferedLocaEdit());
        break;
    }
    switch(index){
      case 2:
        Get.to(Shipments());
        break;
    }
    switch(index){
      case 3:
        Get.to(Payment());
        break;
    }
    switch(index){
      case 4:
        Get.to(Help());
        break;
    }
    switch(index){
      case 5:
        Get.to(InviteFriends());
        break;
    }
    switch(index){
      case 6:
        FirebaseAuth.instance.signOut();
        Get.offAll(LoginScreen());
        Fluttertoast.showToast(msg: "You are now Logged off");
        print("object");
    }

  }
}

