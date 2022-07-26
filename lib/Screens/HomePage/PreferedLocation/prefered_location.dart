import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flyerapp/Screens/Api/all_api.dart';
import 'package:flyerapp/Screens/HomePage/homepage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../Constants/colors.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
class PreferedLocation extends StatefulWidget {
  const PreferedLocation({Key? key}) : super(key: key);

  @override
  State<PreferedLocation> createState() => _PreferedLocationState();
}

class _PreferedLocationState extends State<PreferedLocation> {
  TextEditingController stateController = TextEditingController(text: "");
  TextEditingController cityController = TextEditingController(text: "");
  var lat;
  var long;
  Future getLatLong() async {
    try {
      List<Location>? locations =
          await locationFromAddress("Kolkata,West bengal")
              .then((value) {
        var lat = value[0].latitude;
        var long = value[0].longitude;
        updateLocation(
            lat, long, stateController.text, cityController.text);
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error", e.toString());
    }
  }

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
                SizedBox(
                  height: H * 0.03,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          height: H * 0.02,
                          width: W * 0.065,
                          child: Image.asset(
                            "assets/images/back_arrow.png",
                          )),
                    ),
                    Text(
                      "  Add Your Prefered Location",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Semibold',
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: H * 0.03,
                ),
                Container(
                    width: W * 0.9,
                    height: H * 0.07,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flyGray4,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: Colors.black12, width: 0.6)),
                    child: TextFormField(
                      controller: stateController,
                      decoration: InputDecoration(
                          hintText: "Enter your State",
                          hintStyle: TextStyle(fontFamily: "OpenSans-Medium"),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Container(
                              child: Image.asset(
                                  "assets/images/location_logo.png")),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    )),
                SizedBox(
                  height: H * 0.02,
                ),
                Container(
                    width: W * 0.9,
                    height: H * 0.07,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: flyGray4,
                              offset: Offset(0.1, 0.1),
                              blurRadius: 10)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: Colors.black12, width: 0.6)),
                    child: TextFormField(
                      cursorColor: flyOrange1,
                      controller: cityController,
                      decoration: InputDecoration(
                          hintText: "Enter your City",
                          hintStyle: TextStyle(fontFamily: "OpenSans-Medium"),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Container(
                              child: Image.asset(
                                  "assets/images/location_logo.png")),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    )),
                SizedBox(
                  height: H * 0.016,
                ),
                Stack(
                  children: [
                    Container(
                      height: H * 0.55,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/location.png",
                              ))),
                    ),
                    Center(
                      child: Container(
                          height: H * 0.1,
                          width: W * 0.1,
                          child: Image.asset(
                            "assets/images/track_location.png",
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: H * 0.03,
                ),
                InkWell(
                  onTap: () {
                    updateLocation(
                        19.1621156,
                        73.0301096,
                        stateController.text, cityController.text);
                    // print(stateController.text);
                    // print(cityController.text);
                    // getLatLong();
                  },
                  child: Container(
                    width: W * 0.9,
                    height: H * 0.08,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        gradient: LinearGradient(
                            colors: [flyOrange1, flyOrange2],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: Center(
                        child: Text(
                      "Confirm Location",
                      style: TextStyle(
                          fontFamily: 'OpenSans-Medium',
                          fontSize: 16,
                          color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: H * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.to(HomePage());
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(
                            color: Color(0xFF646464),
                            fontFamily: 'OpenSans-Semibold',
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: W * 0.03,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: H * 0.028,
                          width: W * 0.06,
                          child: Image.asset(
                            "assets/images/orange_arrow_frnt.png",
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future updateLocation(double lat, double long,String state,String city) async {
    var token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZDhmNmEwOTQ4MzhiNjc5MDZiN2VmOCIsImlhdCI6MTY1ODQ3MTc2NiwiZXhwIjoxNjY4ODM5NzY2fQ.3tWNWqu9CQCAFMAlFJHsVQhAaMllwUugDY7xLaR7R-I";
    var apiURL =
        "https://nodeserver.mydevfactory.com:8087/distributor/location";

    http.Response response = await http.patch(Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': token,
        },
        body: json.encode({
    "locations": [
      {"latitude": lat, "longitude": long, "address": "$city, $state","city" : city}
    ]
        }));

    var data = jsonDecode(response.body);
    print(data);

    // dio.FormData formData = dio.FormData.fromMap({
    //   "locations": [
    //     {"latitude": lat, "longitude": long, "address": "$city, $state"}
    //   ]
    // });
    // var dio1 = Dio(
    //   BaseOptions(
    //     headers: {
    //       'Content-Type': 'application/json; charset=utf-8',
    //       'x-access-token': token,
    //     },
    //   ),
    // );
    //
    // var response = await dio1.patch(
    //   apiURL,
    //   data: formData,
    // );
    // if (response.statusCode == 200) {
    //   var data = response.data;
    //   print(data);
    // } else {
    //   var data = response.data;
    //   print(data);
    // }
  }
}
