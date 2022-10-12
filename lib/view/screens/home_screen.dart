import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int brojStranice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        onTap: (index) {
          setState(() {
            brojStranice = index;
          });
        },
        currentIndex: brojStranice,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.compass_calibration_rounded,
              size: 25,
            ),
            label: "Discover",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 25,
            ),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              size: 25,
            ),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: Center(
        child: stranice[brojStranice],
      ),
    );
  }
}
