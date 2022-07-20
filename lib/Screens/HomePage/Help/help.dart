import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flyerapp/Screens/HomePage/Help/chat_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../Notifications/notifications.dart';
import '../../SharedPrefrence/sharedprefrence.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  IO.Socket? socket;
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
    socket!.onConnect((data) {
      print("Connected");
      socket!.on('message', (data) {
        print("listen");
        print(data);
        chatController.messageslist.add(ChatMessage(
            messageContent: data["message"], messageType: data["userId"]));
      });
    });
    socket!.onDisconnect((data) => print("DisConnected"));
    // socket!.emit('message',
    //     {"message": "Checking...", "userId": 10, "username": "Harshad"});
    print(socket!.connected);
  }

  ChatController chatController = Get.put(ChatController());

  @override
  void initState() {
    super.initState();
    connect();
    chatController.getMessage();
    if (socket != null) {
      socket!.on('message', (data) {
        print("listen");
        print(data);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    var H = MediaQuery.of(context).size.height;
    var W = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: flyBackground,
      appBar: AppBar(
        backgroundColor: flyBackground,
        elevation: 0,
        leading: Container(
            child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF4D4D4D),
                ))),
        title: Text("Help"),
        titleTextStyle: TextStyle(
          fontFamily: "OpenSans-Semibold",
          fontSize: 18,
          color: Colors.black,
        ),
        titleSpacing: 2,
        actions: [
          InkWell(
            onTap: () {
              Get.to(Notifications());
            },
            child: Padding(
              padding: EdgeInsets.only(right: W * 0.04),
              child: Center(
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      color: flyBlack2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: W * 0.03,
                      ),
                      child: CircleAvatar(
                        backgroundColor: flyOrange2,
                        radius: 7,
                        child: Text(
                          "3",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => Stack(
          children: [
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: W * 0.05, bottom: W * 0.05),
            //       child: Text(
            //         "Invite friends by",
            //         style: TextStyle(
            //           fontFamily: "OpenSans-Regular",
            //           fontSize: 16,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Padding(
              padding: EdgeInsets.only(bottom: H * 0.05),
              child: ListView.builder(
                itemCount: chatController.messageslist.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment:
                              (chatController.messageslist[index].messageType ==
                                      "admin"
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (chatController
                                          .messageslist[index].messageType ==
                                      "admin"
                                  ? Color.fromARGB(255, 197, 197, 197)
                                  : flyOrange1),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              chatController.messageslist[index].messageContent,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "OpenSans-Regular",
                                  color: chatController.messageslist[index]
                                              .messageType ==
                                          "admin"
                                      ? Color(0xff4b4b4b)
                                      : Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: H * 0.069,
                  width: W,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.transparent, width: 0.5)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: W,
                          child: Center(
                            child: TextFormField(
                              controller: textController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Type a message",
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'OpenSans-Regular',
                                      color: flyGray3),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: W * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: Image.asset(
                                      "assets/images/attachment.png")),
                              SizedBox(
                                width: W * 0.03,
                              ),
                              InkWell(
                                onTap: () async {
                                  var userId = await getId();
                                  var name = await getName();
                                  // print(name);
                                  // print(userId);
                                  // print(textController.text);
                                  socket!.emit('message', {
                                    "message": textController.text,
                                    "userId": userId,
                                    "username": name
                                  });
                                  print("send");
                                   chatController.messageslist.add(ChatMessage(
                                       messageContent: textController.text,
                                       messageType: name!));
                                   textController.clear();
                                },
                                child: CircleAvatar(
                                    radius: 21,
                                    backgroundColor: flyOrange3,
                                    child:
                                        Image.asset("assets/images/send.png")),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
