import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/liveScreen/live_screen.dart';
import 'package:tiktok/view/screens/profileScreens/profile.dart';
import 'package:tiktok/view/screens/searchScreen/search.dart';
import 'package:tiktok/view/screens/videoScreens/upload_video_screen.dart';
import 'package:tiktok/view/screens/videoScreens/video_screen.dart';

const backgroundColor = Colors.black;

const buttonColor = Colors.red;

const borderColor = Colors.grey;

List stranice = [
  VideoScreen(),
  const LiveScreen(),
  const UploadVideo(),
  SearchScreen(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid)
];
