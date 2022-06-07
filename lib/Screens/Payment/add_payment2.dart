import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';

class AddBankAccount2 extends StatefulWidget {
  const AddBankAccount2({Key? key}) : super(key: key);

  @override
  State<AddBankAccount2> createState() => _AddBankAccount2State();
}

class _AddBankAccount2State extends State<AddBankAccount2> {
  String dropDownValue = 'Today';
  final items = [
    'Today',
    'Last 10 Days',
    'Last Month',
    'Last Year'
  ];

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(
              child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back,color: Color(0xFF4D4D4D),))),
          title: Text("Add Bank Account"),
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans-Semibold",
            fontSize: 22,
            color: Colors.black,

          ),
          titleSpacing: 2,

        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               Align(
                 alignment: Alignment.centerRight,
                 child: Container(
                   height: H*0.055,
                   padding: EdgeInsets.only(left: W*0.05),
                   decoration: BoxDecoration(
                       color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(8)),
                     border: Border.all(color: Colors.black,width: 1)
                   ),
                   child: DropdownButton<String>(
                     underline: Divider(color: Colors.transparent),
                     borderRadius: BorderRadius.all(Radius.circular(8)),
                     value: dropDownValue,
                     icon: Icon(Icons.keyboard_arrow_down),
                     items: items.map((String items){
                       return DropdownMenuItem(
                         value: items, child: Text(items,style: TextStyle(
                         fontSize: 15,
                         fontFamily: "Opensans-Regular"
                       ),),
                       );
                     }).toList(),
                     onChanged: (String? newValue){
                       setState((){
                         dropDownValue = newValue!;
                       });
                     },
                   ),
                 ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
