import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/profile.dart';
import 'package:tiktok/view/screens/videoScreens/upload_video_screen.dart';
import 'package:tiktok/view/screens/videoScreens/video_screen.dart';

const backgroundColor = Colors.black;

const buttonColor = Colors.red;

const borderColor = Colors.grey;

List stranice = [
  VideoScreen(),
  const Text("Discover"),
  const UploadVideo(),
  const Text("inbox"),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid)
];
