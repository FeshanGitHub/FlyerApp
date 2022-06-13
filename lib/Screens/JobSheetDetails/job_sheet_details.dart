import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/HomePage/homepage.dart';
import 'package:flyerapp/Screens/Job%20Sheet/job_sheet.dart';
import 'package:flyerapp/Screens/Job%20Sheet/job_sheet_main.dart';
import 'package:flyerapp/Screens/Start%20Job/start_job.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';

class JobSheetDetails extends StatefulWidget {
  const JobSheetDetails({Key? key}) : super(key: key);

  @override
  State<JobSheetDetails> createState() => _JobSheetDetailsState();
}

class _JobSheetDetailsState extends State<JobSheetDetails> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return Scaffold(
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
        title: Text("Job Sheet Details"),
        titleTextStyle: TextStyle(
          fontFamily: "OpenSans-Semibold",
          fontSize: 20,
          color: Colors.black,
        ),
        titleSpacing: 2,
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
      body: Center(
        child: Column(
          children: [
            Container(
              height: H*0.38,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter
                    ,child: Container(
                    height: H*0.2,
                    width: W*0.9,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [flyMargenta,flyOrange2],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CORPORATE",
                                style: TextStyle(
                                    fontFamily: "Gothic-Regular",
                                    color: Colors.white,
                                    fontSize: 23
                                ),
                              ),
                              Text("FLYER",
                                style: TextStyle(
                                    fontFamily: "Gothic-Bold",
                                    color: Colors.white,
                                    fontSize: 45
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: W*0.05,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello John",
                                style: TextStyle(
                                    fontFamily: "Gothic-Regular",
                                    color: Colors.white,
                                    fontSize: 23
                                ),
                              ),
                              Text("info@johndeo.com",
                                style: TextStyle(
                                    fontFamily: "Gothic-Regular",
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.only(top: H*0.1),
                      child: Container(
                        width: W*0.8,
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(
                                offset: Offset.zero,
                                color:flyGray4,
                                blurRadius: 10
                            )],
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Flyer Distribution",
                                style: TextStyle(
                                    fontFamily: 'OpenSans-Bold',
                                    fontSize: 18
                                ),
                              ),
                              SizedBox(height: H*0.01,),
                              Row(
                                children: [
                                  Text("Job Post Date:",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans-Regular',
                                        fontSize: 14,
                                        color: Color(0xFF808080)
                                    ),
                                  ),
                                  Text(" 17 May 2022",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans-Regular',
                                        fontSize: 14,
                                        color: Color(0xFF333333)
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Location:",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans-Regular',
                                        fontSize: 14,
                                        color: Color(0xFF808080)
                                    ),
                                  ),
                                  Text(" Area 1,New Town,Kolkata 700091",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans-Regular',
                                        fontSize: 12,
                                        color: Color(0xFF333333)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: H*0.04,),
                              Divider(
                                color: Color(0xFFEFEFEF),
                              ),
                              Row(
                                children: [
                                  Text("Tracking ID:",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans-Regular',
                                        fontSize: 14,
                                        color: Color(0xFF808080)
                                    ),
                                  ),
                                  Text(" 252312",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans-Regular',
                                        fontSize: 12,
                                        color: Color(0xFF333333)
                                    ),
                                  ),
                                  SizedBox(height: H*0.04,),

                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: H*0.04,),
            InkWell(
              onTap: (){
              Get.to(JobSheetMain());
              },
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
                Text("Track",
                  style: TextStyle(
                      fontFamily: "Opensans-Bold",
                      fontSize: 16,
                      color: Colors.white
                  ),
                )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
