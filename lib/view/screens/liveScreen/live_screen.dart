import 'package:flutter/material.dart';

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
                  children: const [
                    Text("Go live with TikTok App in just one click!"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Every user in this app can view your live video!"),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
