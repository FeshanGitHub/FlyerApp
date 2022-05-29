import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';



class JobTracking extends StatefulWidget {
  const JobTracking({Key? key}) : super(key: key);

  @override
  State<JobTracking> createState() => _JobTrackingState();
}

class _JobTrackingState extends State<JobTracking> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: H*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: H*0.02,
                            width: W*0.065,
                            child: Image.asset("assets/images/back_arrow.png",)),
                        Text("  Job Tracking",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Semibold',
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),
                    Stack(
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
                    )
                  ],
                ),
                SizedBox(height: H*0.03,),
                Stack(
                  children: [
                    Container(
                      height: H*0.55,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/location.png",
                              )
                          )
                      ),
                    ),
                    Center(
                      child:  Container(
                          height: H*0.5,
                          width: W*0.5,
                          child: Image.asset("assets/images/job_tracker.png",)),
                    )
                  ],
                ),
                SizedBox(height: H*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: W*0.42,
                        height: H*0.08,
                        decoration: BoxDecoration(
                          color: flyGray5,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(child:
                        Text("Start Job",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              fontSize: 16,
                              color: flyBlack2
                          ),
                        )
                        ),
                      ),
                    ),
                    SizedBox(width: W*0.07,),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        width: W*0.42,
                        height: H*0.08,
                        decoration: BoxDecoration(
                          color: flyBlue1,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(child:
                        Text("Complete",
                          style: TextStyle(
                              fontFamily: 'OpenSans-Bold',
                              fontSize: 16,
                              color: Colors.white
                          ),
                        )
                        ),
                      ),
                    ),

                  ],),
                SizedBox(height: H*0.015,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    width: W*0.8,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: H*0.028,
                                width: W*0.07,
                                child: Image.asset("assets/images/camera.png"),),
                                SizedBox(width: W*0.03,),
                            Text("Take Picture",
                              style: TextStyle(
                                  fontFamily: 'OpenSans-Bold',
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                ),
                SizedBox(height: H*0.03,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
