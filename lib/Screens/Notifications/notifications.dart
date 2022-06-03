import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: flyBackground,
        appBar: AppBar(
          backgroundColor: flyBackground,
          elevation: 0,
          leading: Container(
              child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back,color: Color(0xFF4D4D4D),))),
          title: Text("Notifications"),
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans-Semibold",
            fontSize: 18  ,
            color: Colors.black,

          ),
          titleSpacing: 2,
          actions: [Center(
            child: Padding(
              padding:  EdgeInsets.only(right: W*0.04),
              child: Text("Clear All",
              style: TextStyle(
                fontFamily: "OpenSans-Regular",
                fontSize: 15  ,
                color: flyBlue1,
              ),
              ),
            ),
          )],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                  itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          buildNotificationCard(H, W),
                          SizedBox(height: H*0.02,)
                        ],
                      );
                  },
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildNotificationCard(double H, double W) {
    return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [BoxShadow(
                      offset: Offset(4,4),
                      blurRadius: 5,
                      color: flyGray4
                    )]
                ),
                height: H*0.1,
                width: W*0.9,
                child: Center(child: Text("Lorem ipsum is placeholder text commonly\nused in the graphic, print, and publishing\nindustries.",
                style: TextStyle(
                  fontFamily: "Opensans-Regular",
                  fontSize: 15,
                  color: Color(0xFF626262)
                ),
                ))
            );
  }
}
