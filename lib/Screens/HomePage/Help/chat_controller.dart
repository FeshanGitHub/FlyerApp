import 'package:get/get.dart';

import 'help.dart';

class ChatController extends GetxController {
  RxList<ChatMessage> messageslist = <ChatMessage>[].obs;

  void getMessage() async {
    messageslist.add(
      ChatMessage(
          messageContent:
              "Hi there! you can begin by asking your question below...",
          messageType: "admin"),
    );
  }
}
