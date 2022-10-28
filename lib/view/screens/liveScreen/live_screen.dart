import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/view/screens/liveScreen/live_chat.dart';

import '../auth/menu_auth.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "TikTok clone live",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(22),
          child: Center(
            child: Column(
              children: [
                Column(
                  children: [
                    const Text("Go live with TikTok App in just one click!"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Every user in this app can view your live video!"),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        Image.asset('assets/slika3.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 60),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const ChatPage());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size.fromHeight(10),
                            padding: const EdgeInsets.all(20)),
                        child: const Text('Start live video!'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
