import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FaceRecognition extends StatefulWidget {
  const FaceRecognition({Key? key}) : super(key: key);

  @override
  State<FaceRecognition> createState() => _FaceRecognitionState();
}

class _FaceRecognitionState extends State<FaceRecognition> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
       body: SingleChildScrollView(
         child: Center(
           child: Column(
             children: [
               SizedBox(height: H*0.04,),
               Padding(
                 padding:  EdgeInsets.only(left: W*0.05),
                 child: Row(
                   children: [
                   InkWell(
                     onTap: (){
                       Get.back();
                     },
                     child: Container(
                         height: H*0.028,
                         width: W*0.07,
                         child: Image.asset("assets/images/back_arrow.png",)),
                   ),
                     Text("  Face Recognition",
                     style: TextStyle(
                         fontFamily: 'OpenSans-Medium',
                       fontSize: 24
                     ),
                     )
                   ],
                 ),
               ),
               SizedBox(height: H*0.03,),
               Container(
                    height: H*0.77,
                    width: W*0.9,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/face.png"
                        ),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
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
