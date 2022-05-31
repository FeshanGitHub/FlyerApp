import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/LoginScreen/login_screen.dart';
import 'package:flyerapp/Screens/SplashScreen/splash_screen.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
bool selectedTile = false;
bool selectedTile1 = false;
bool selectedTile2 = false;
bool selectedTile3 = false;
bool selectedTile4 = false;
bool selectedTile5 = false;
bool selectedTile6 = false;
bool selectedTile7 = false;
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF6F7F9),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Container(
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
                          child: CircleAvatar(
                            radius: 33,
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
                      SizedBox(width: W*0.05,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("John Doe",
                        style: TextStyle(
                          fontFamily: "Roboto-Medium",
                          fontSize: 20,
                        ),
                        ),
                          Text("info@johndoe.com",
                            style: TextStyle(
                              fontFamily: "Gothic-Regular",
                              fontSize: 18,
                              color: Color(0xFFA8A8A8)
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: H*0.05,),
                Container(
                  padding: EdgeInsets.only(right: W*0.06),
                  child: Divider(
                    color: Color(0xFFE0E0E0),
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFD6D6D6),
                          child: CircleAvatar(
                            radius: 22,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                            ,child: Center(
                            child: Container(
                              height: H*0.022,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/deliveries.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile1 ?Text("Deliveries",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Deliveries",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile1 = !selectedTile1;
                        });
                      },
                    ),
                    SizedBox(height: H*0.01,),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFD6D6D6),
                          child: CircleAvatar(
                            radius: 22,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                            ,child: Center(
                            child: Container(
                              height: H*0.025,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/prefered_location.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile2 ?Text("Prefered Location",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Prefered Location",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile2 = !selectedTile2;
                        });
                      },
                    ),
                    SizedBox(height: H*0.01,),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFD6D6D6),
                          child: CircleAvatar(
                            radius: 22,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                            ,child: Center(
                            child: Container(
                              height: H*0.03,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/shipments.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile3 ?Text("Shipments",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Shipments",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile3 = !selectedTile3;
                        });
                      },
                    ),
                    SizedBox(height: H*0.01,),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
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
                                    image: AssetImage("assets/images/payments.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile4 ?Text("Payments",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Payments",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile4 = !selectedTile4;
                        });
                      },
                    ),
                    SizedBox(height: H*0.01,),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFD6D6D6),
                          child: CircleAvatar(
                            radius: 22,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                            ,child: Center(
                            child: Container(
                              height: H*0.03,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/help.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile5 ?Text("Help",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Help",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile5 = !selectedTile5;
                        });
                      },
                    ),
                    SizedBox(height: H*0.01,),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFD6D6D6),
                          child: CircleAvatar(
                            radius: 22,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                            ,child: Center(
                            child: Container(
                              height: H*0.025,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/invite.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile6 ?Text("Invite",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Invite",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile6 = !selectedTile6;
                        });
                      },
                    ),
                    SizedBox(height: H*0.01,),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: W*0.05),
                      selected: selectedTile7,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      selectedTileColor: flyOrange2,
                      leading:    InkWell(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Color(0xFFD6D6D6),
                          child: CircleAvatar(
                            radius: 22,
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white
                            ,child: Center(
                            child: Container(
                              height: H*0.025,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/logout.png"),
                                  )
                              ),
                            ),
                          ),
                          ),
                        ),
                      ),
                      title:  selectedTile7 ?Text("Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ): Text("Logout",
                        style: TextStyle(
                          color: Color(0xFF696969),
                          fontFamily: "Roboto-Regular",
                          fontSize: 18,
                        ),
                      ) ,
                      onTap: (){
                        setState((){
                          selectedTile7 = !selectedTile7;
                          Get.to(LoginScreen());
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ),
       appBar: AppBar(
         toolbarHeight: H*0.12,
         elevation: 0,
         backgroundColor: Colors.transparent,
         leading: Builder(
           builder: (BuildContext context) { return IconButton(
             icon: Container(
                 height: H*0.02,
                 child: Image.asset("assets/images/drawer.png")),
             onPressed: () {
               return Scaffold.of(context).openDrawer();
             },
           ); },
         ),
         actions: [
           Padding(
             padding:  EdgeInsets.only(right: W*0.03),
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
           )
         ],
       ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/hello_homescreen.png"
                      ),
                      fit: BoxFit.fill
                    )
                  ),
                  height: H*0.2,
                  width: W*0.9,
                  child: Padding(
                    padding:  EdgeInsets.only(left: W*0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hello John",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSans-Bold',
                            color: Colors.white
                        ),
                        ),
                        Text("info@johndoe.com",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'OpenSans-Regular',
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: H*0.03,),
              Text("     Recent job list",
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'OpenSans-Bold',
                    color: flyBlue1
                ),
              ),
              SizedBox(height: H*0.02,),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context ,index){
                    return Column(
                      children: [
                        buildCardFlyer(H, W),
                        SizedBox(height: H*0.015,)
                      ],
                    );
                  })
            ],
          ),
        ),
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
}
