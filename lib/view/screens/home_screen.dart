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
        selectedItemColor: Colors.red,
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
              Icons.live_tv,
              size: 25,
            ),
            label: "Go live",
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
              Icons.search,
              size: 25,
            ),
            label: "Search",
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
