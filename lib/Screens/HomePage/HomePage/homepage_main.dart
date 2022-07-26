import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/SharedPrefrence/sharedprefrence.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../Api/all_api.dart';
import '../../Job Details/job_details.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../UserModel/job_model.dart';
import '../../UserModel/user_model.dart';


class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key,}) : super(key: key);


  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  late Future<JobModel> futureAlbum;
  void initState(){
    connect();
    getUserData();
    getJobData();
    super.initState();
  }
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String name = "";
  String email = "";
  IO.Socket? socket;
  String? userNameAPI;
  String? userEmail;
  double? lat;
  double? long;
  List<dynamic> _jobs = [];
  bool _loading = false;
  Future<List<Datum>> getJobData()async{
    setState((){
      _loading = true;
    });
    var url = "https://nodeserver.mydevfactory.com:8087/distributor/preferredJobs";
    var response = await http.get(Uri.parse(url,),
      headers: {
    'x-access-token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyZDhmNmEwOTQ4MzhiNjc5MDZiN2VmOCIsImlhdCI6MTY1ODQ3MTc2NiwiZXhwIjoxNjY4ODM5NzY2fQ.3tWNWqu9CQCAFMAlFJHsVQhAaMllwUugDY7xLaR7R-I",
    },);
    // JobModel jobModel = JobModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    // print(jobModel.jobTitle);
    var jsonData = jsonDecode(response.body);
    setState((){
      _jobs = jsonData['data'];
      print(_jobs[0]['jobTitle']);
      _loading = false;
    });
    print(jsonData);
    return jsonData;
  }
  var userName;
  void connect() async {
    userName = await getName();
    socket = IO.io(
      "https://nodeserver.mydevfactory.com:8087",
      {
        'transports': ['websocket'],
        'autoConnect': false,
      },
    );
    socket!.connect();
    try {
      socket!.onConnect((data) {
        print("Connected");

      });
    } catch (e) {
      print(e.toString());
    }
    socket!.onDisconnect((data) => print("DisConnected"));
    print(socket!.connected);
  }
  Position? currentPosition;
  Future locatePosition()async
  {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    lat = position.latitude;
    print(lat);
    long = position.longitude;
    print(long);
    var location = ({
      "lat": lat,
      "lng": long,
    });
    socket!.emit('liveLocationUpdate', {location});
  }
  Future setUserData()async{
    userNameAPI = await setName('');
    userEmail = await setEmail('');
    setState((){
      userNameAPI;
      userEmail;
    });
  }

  Future getUserData()async{
    userNameAPI = await getName();
    userEmail = await getEmail();
   setState((){
     userNameAPI;
   });
  }

  @override
  Widget build(BuildContext context) {

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFF6F7F9),
        body:  SingleChildScrollView(
      child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: H * 0.08,
                  padding: EdgeInsets.only(left: W * 0.05,
                      right: W * 0.05),
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_rounded,
                          color: Color(0xFF8771A7),),
                        hintText: "Search Your Jobs here......",
                        hintStyle: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF4A4979),
                            fontFamily: "NunitoSans-Regular"
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: flyOrange2, width: 2),
                            borderRadius: BorderRadius.all(
                                Radius.circular(32))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: flyOrange2, width: 2),
                            borderRadius: BorderRadius.all(
                                Radius.circular(32))
                        )
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight
                , child: Padding(
                padding: EdgeInsets.only(right: W * 0.052,),
                child: Container(
                  height: H * 0.08,
                  width: W * 0.16,
                  child: Center(child:
                  Text("Go", style: TextStyle(
                      fontSize: 20,
                      fontFamily: "NunitoSans-Bold",
                      color: Colors.white
                  ),),),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: flyOrange2,
                  ),
                ),
              ),
              )
            ],
          ),
          SizedBox(height: H*0.02,),
          InkWell(
            onTap: (){
              locatePosition();
            },
            child: Center(
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
                      Text("$userNameAPI",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'OpenSans-Bold',
                            color: Colors.white
                        ),
                      ),
                      Text("$userEmail",
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
          ),
          SizedBox(height: H*0.03,),
          Text("     Prefered job list",
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'OpenSans-Bold',
                color: flyBlue1
            ),
          ),
          SizedBox(height: H*0.02,),
          _jobs.isNotEmpty ? ListView.builder(
              itemCount: _jobs.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context ,index){
                var date = _jobs[0]['createdAt'];
                return Column(
                  children: [
                    InkWell(
                        onTap: (){
                          Get.to(JobDetails());
                        },
                        child: Container(
                          height: H*0.15,
                          width: W*0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              _loading ?CircularProgressIndicator(color: flyOrange2,)  : Container(
                                  color: Colors.red,
                                  width: W*0.3,
                                  height: H*0.15,
                                  child: Image.network(_jobs[0]['bannerImage'],fit: BoxFit.cover,)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: H*0.03,),
                                  Text(" ${_jobs[0]['jobTitle']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'OpenSans-Bold',
                                        color: Color(0xFF333333)
                                    ),
                                  ),
                                  SizedBox(height: H*0.01,),
                                  Row(
                                    children: [
                                      Text("  Location :",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'OpenSans-Regular',
                                            color: Color(0xFF808080)
                                        ),
                                      ),
                                      Text(_jobs[0]['startLocation']['address'],
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
                                      Text(formatter.parse(date).toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'OpenSans-Regular',
                                            color: Color(0xFF333333)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: H*0.015,)
                  ],
                );
              }) : Center(child: CircularProgressIndicator(color: flyOrange2,))
        ],
      ),
    ),
    )
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
  Future apiCallLoginData()async{
    http.Response response;
    response = await http.get(Uri.parse("https://nodeserver.mydevfactory.com:8087/distributor/login"));
    if(response.statusCode == 200){
      setState((){
        var stringRespone = response.body.length;
        print(stringRespone);
      });
    }
  }
}
class Job {
  final String name;
  Job({required this.name});
}
