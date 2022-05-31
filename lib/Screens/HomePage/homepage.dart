import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/HomePage/Deliveries/deliveries.dart';
import 'package:flyerapp/Screens/HomePage/Help/help.dart';
import 'package:flyerapp/Screens/HomePage/Invite/invite.dart';
import 'package:flyerapp/Screens/HomePage/Payment/payment.dart';
import 'package:flyerapp/Screens/HomePage/PreferedLocation/prefered_location.dart';
import 'package:flyerapp/Screens/HomePage/Shipments/shipments.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../Constants/colors.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey =GlobalKey<ScaffoldState>();
  GlobalKey bottomNavigationKey = GlobalKey();
  int selectedPos = 0;
  var selectedCard = 'Deliveries';
  var selectedIndex = 0;
  List<TabItem> tableItems = List.of([
    TabItem(Icons.home,"Home",flyOrange2,labelStyle: TextStyle(fontFamily: 'Roboto-Regular',color: Color(0xFF4D4D4D))),
    TabItem(Icons.cases_rounded ,"Job Sheet",flyOrange2,labelStyle: TextStyle(fontFamily: 'Roboto-Regular',color: Color(0xFF4D4D4D))),
    TabItem(Icons.person,"Profile",flyOrange2,labelStyle: TextStyle(fontFamily: 'Roboto-Regular',color: Color(0xFF4D4D4D))),
  ]);
   late CircularBottomNavigationController _navigationController;
  var homePages = [
    Deliveries(),
    PreferedLocMainMenu(),
    Shipments(),
    Payment(),
    Help(),
    Invite()
  ];
  @override
  void initState(){
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFF6F7F9),
      key: scaffoldKey,
      bottomNavigationBar: CircularBottomNavigation(
        tableItems,
        circleSize: 60,
        iconsSize: 28,
        barHeight: H*0.07,
        controller: _navigationController,
        normalIconColor: Color(0xFF4D4D4D),

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
        actions: [Padding(
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
  InkWell buildDrawerCard(double H,String image,String name ,index) {
    return InkWell(
                  onTap: (){
                    setState((){
                    selectedCard = name;
                    selectedIndex = index;
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
}
