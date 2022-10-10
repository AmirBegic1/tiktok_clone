import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/constants.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/view/screens/auth/login.dart';

import 'view/screens/auth/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      theme:
          //postavljanje default backgrounda kroz main
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const Login(),
    );
  }
}
