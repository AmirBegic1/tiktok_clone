import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

import 'view/screens/auth/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok',
      debugShowCheckedModeBanner: false,
      theme:
          //postavljanje default backgrounda kroz main
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: SignUp(),
    );
  }
}
