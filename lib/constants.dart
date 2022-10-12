import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/profile.dart';

const backgroundColor = Colors.black;

const buttonColor = Colors.red;

const borderColor = Colors.grey;

var stranice = [
  Text("Home"),
  Text("Discover"),
  Text("add video"),
  Text("inbox"),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid)
];
