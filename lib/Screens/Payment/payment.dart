import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/Payment/add_payment1.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../Notifications/notifications.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool checkBox = false;
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
          title: Text("Payment"),
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans-Semibold",
            fontSize: 18  ,
            color: Colors.black,

          ),
          titleSpacing: 2,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: H*0.02,),
              Text("Transacation History",
                style: TextStyle(
                    color: flyBlue1,
                    fontFamily: "Opensans-Bold",
                    fontSize: 15
                ),
              ),
              SizedBox(height: H*0.04,),
              Container(
                height: H*0.23,
                child: Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topCenter
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
                          height: H*0.2,
                          width: W*0.9,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Bank Account Details",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Opensans-Semibold",
                                          color: Color(0xFF828282)
                                      ),
                                    ),
                                    Checkbox(value: checkBox,
                                        checkColor: Colors.white,
                                        activeColor: flyOrange2,
                                        onChanged: (value)
                                        {
                                          setState((){
                                            checkBox = value!;
                                          });
                                        }),

                                  ],
                                ),
                                Row(
                                children: [
                                  Text("Account Holder Name:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF828282),
                                        fontFamily: "Opensans-Regular"
                                    ),
                                  ),
                                  Text(" John Doe",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF828282),
                                        fontFamily: "Opensans-Regular"
                                    ),
                                  ),
                                ],
                              ),
                                Row(
                                  children: [
                                    Text("Account Number:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF828282),
                                          fontFamily: "Opensans-Regular"
                                      ),
                                    ),
                                    Text(" 123456789",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF828282),
                                          fontFamily: "Opensans-Regular"
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("IFSC:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF828282),
                                          fontFamily: "Opensans-Regular"
                                      ),
                                    ),
                                    Text(" ICICIB20556",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF828282),
                                          fontFamily: "Opensans-Regular"
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: W*0.08),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                              onTap: (){},
                              child: CircleAvatar(
                                radius: 23,
                                backgroundColor: Color(0xFFDBDBDB),
                                child: CircleAvatar(
                                  radius: 22,
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white
                                  ,child: Container(
                                  height: H*0.05,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/delete.png"),
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
              SizedBox(height: H*0.35,),
              InkWell(
                onTap: (){
                  Get.to(AddBankAccount1());
                },
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
                  Text("Add Bank Account",
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
      ),
    );
  }
}
