import 'package:flutter/material.dart';

import 'package:tiktok/view/screens/auth/login.dart';
import 'package:tiktok/view/screens/auth/register.dart';
import 'package:tiktok/view/screens/home_screen.dart';

import '../../../constants.dart';

class MenuAuth extends StatefulWidget {
  const MenuAuth({Key? key}) : super(key: key);

  @override
  State<MenuAuth> createState() => _MenuAuthState();
}

class _MenuAuthState extends State<MenuAuth> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wellcome to TikTok",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Register",
              ),
              Tab(
                text: "Login",
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [SignUp(), Login()]),
      ),
    );
  }
}
