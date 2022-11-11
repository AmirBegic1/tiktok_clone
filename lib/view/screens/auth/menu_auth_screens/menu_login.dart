import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

import 'package:tiktok/view/screens/auth/menu_auth.dart';

class MenuLogin extends StatefulWidget {
  const MenuLogin({Key? key}) : super(key: key);

  @override
  State<MenuLogin> createState() => _MenuLoginState();
}

class _MenuLoginState extends State<MenuLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 30,
          title: const Text("Wellcome to the TikTok clone"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "Sign up for TikTok clone",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 7,
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Center(
                    child: Text(
                      "Create a profile, follow other accounts, make your own videos, and more.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const MenuAuth());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: const Size.fromHeight(10),
                            padding: const EdgeInsets.all(20)),
                        child: const Text('Use phone or email'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Or continue with",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SignInButton(
                          Buttons.Facebook,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          Buttons.Twitter,
                          mini: true,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 180,
                    ),
                    const Center(
                      child: Text(
                        "By contining, you agree to our Terms of Serivce and acknowledge that you have read out Privacy Policy to learn how we collect, use, and share your data.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
