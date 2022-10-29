import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/chat_controller.dart';

import '../../../model/user.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Chat rooms"),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: chatController.chatuser.isEmpty
              ? const Center(
                  child: Text(
                    'Error with database right now!',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: chatController.chatuser.length,
                    itemBuilder: (context, index) {
                      MojUser user = chatController.chatuser[index];
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: const CircleAvatar(
                            radius: 24,
                            child: Icon(Icons.search),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(right: 12),
                          height: 75,
                          child: GestureDetector(
                            onTap: () {},
                            child: CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  NetworkImage(user.profilePicture),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
        ),
      );
    });
  }
}
