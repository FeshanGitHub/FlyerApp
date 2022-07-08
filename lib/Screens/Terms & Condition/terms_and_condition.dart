import 'package:flutter/material.dart';
import 'package:flyerapp/Constants/colors.dart';
import 'package:get/get.dart';


class TermsAndConditionCustomer extends StatefulWidget {
  const TermsAndConditionCustomer({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionCustomer> createState() => _TermsAndConditionCustomerState();
}

class _TermsAndConditionCustomerState extends State<TermsAndConditionCustomer> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: flyBackground,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Container(
              child: Icon(Icons.arrow_back_ios,color: flyOrange2,size: 20,)),
        ),
        centerTitle: true,
        title: Text("Terms & Condition"),
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: "NunitoSans-Bold",
            color:Color(0xFF184673)
        ),
        actions: [InkWell(
          onTap: (){},
          child: Padding(
            padding:  EdgeInsets.only(right: W*0.04),
            child: Center(
              child: Stack(
                children: [
                  Icon(Icons.notifications,color: Colors.white,),
                  Padding(
                    padding:  EdgeInsets.only(left: W*0.03,),
                    child: CircleAvatar(
                      backgroundColor: flyOrange2,
                      radius: 7,
                      child: Text("3",style: TextStyle(
                          fontSize: 11,
                          color: Colors.white
                      ),),
                    ),
                  )
                ],
              ),
            ),
          ),
        )],
      ),
      backgroundColor: flyBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFECF7FE),
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),

              child:Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: H*0.06,
                      child: Row(
                        children: [
                          Container(
                              height: H*0.01,
                              child: Image.asset("assets/Images/Ellipse 550.png")),
                          SizedBox(width: W*0.01,),
                          Text(" Vitae dicta sunt",
                            style: TextStyle(
                                color: Color(0xFF184673),
                                fontSize: 16,
                                fontFamily: "NunitoSans-Bold"
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("cience dolores eos qui ratione voluptatem sequi nesciunt. \nNeque porro quisquam est, qui dolorem ipsqui ratione ",
                      style: TextStyle(
                          color: Color(0xFF184673),
                          fontSize: 12,
                          fontFamily: "NunitoSans-Regular"
                      ),
                    ),
                    SizedBox(height: H*0.01,),
                    Text("magni dolores eos qui ratione voluptatem sequi nesciunt. \nNeque porro quisquam est, qui dolorem ipsum\nquia dolor sit amet, consectetur.",
                      style: TextStyle(
                          color: Color(0xFF184673),
                          fontSize: 12,
                          fontFamily: "NunitoSans-Regular"
                      ),
                    ),
                    SizedBox(height: H*0.02,),
                    Row(
                      children: [
                        Text("cience dolores eos qui ratione 4.9 sequi ne\nsciunt. Neque porro quisquam est, 2000 ratings.",
                          style: TextStyle(
                              color: Color(0xFF4A4979),
                              fontSize: 12,
                              fontFamily: "NunitoSans-Bold"
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: H*0.03,),
                    Row(
                      children: [
                        Container(
                            height: H*0.01,
                            child: Image.asset("assets/Images/Ellipse 550.png")),
                        SizedBox(width: W*0.01,),
                        Text(" Sed quia non",
                          style: TextStyle(
                              color: Color(0xFF184673),
                              fontSize: 16,
                              fontFamily: "NunitoSans-Bold"
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: H*0.01,),
                    Text("Ut enim ad minima veniam, quis nostrum exercitationem \nullam corporis suscipit laboriosam, nisi ut aliquid ex ea\ncommodi consequatu.",
                      style: TextStyle(
                          color: Color(0xFF4A4979),
                          fontSize: 12,
                          fontFamily: "NunitoSans-Regular"
                      ),
                    ),
                    SizedBox(height: H*0.02,),
                    Text("vitae dicta sunt explicabo. Nemo enim ipsam voluptatem \nquia voluptas sit aspernatur aut odit aut fugit, sed quia \nconsequuntur magni dolores.",
                      style: TextStyle(
                          color: Color(0xFF4A4979),
                          fontSize: 12,
                          fontFamily: "NunitoSans-Regular"
                      ),
                    ),
                    SizedBox(height: H*0.03,),
                    Row(
                      children: [
                        Container(
                            height: H*0.01,
                            child: Image.asset("assets/Images/Ellipse 550.png")),
                        SizedBox(width: W*0.01,),
                        Text(" Nemo enim ipsam",
                          style: TextStyle(
                              color: Color(0xFF184673),
                              fontSize: 16,
                              fontFamily: "NunitoSans-Bold"
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: H*0.01,),
                    Text("Ut enim ad minima veniam, quis nostrum exercitationem \nullam corporis suscipit laboriosam, nisi ut aliquid ex ea\ncommodi consequatu.",
                      style: TextStyle(
                          color: Color(0xFF4A4979),
                          fontSize: 12,
                          fontFamily: "NunitoSans-Regular"
                      ),
                    ),
                    SizedBox(height: H*0.02,),
                    Text("Magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor\nsit amet, consectetur, adipisci velit, sed quia non numqu\nam eius modi tempora incidunt ut labore et dolore mag\nnam aliquam quaerat voluptatem.",
                      style: TextStyle(
                          color: Color(0xFF4A4979),
                          fontSize: 12,
                          fontFamily: "NunitoSans-Regular"
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
