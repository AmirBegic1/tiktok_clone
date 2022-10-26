import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/search_controller.dart';
import 'package:tiktok/model/user.dart';

import '../profileScreens/profile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchProfiles = TextEditingController();

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TextFormField(
            controller: searchProfiles,
            onFieldSubmitted: (value) {
              searchController.searchUser(value);
            },
            decoration: const InputDecoration(
                filled: false,
                hintText: 'Search users',
                hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                prefixIcon: Icon(Icons.search),
                focusColor: Colors.red,
                hoverColor: Colors.red),
            cursorColor: Colors.red,
          ),
        ),
        body: searchController.trazeniUser.isEmpty
            ? const Center(
                child: Text(
                  'Tap on search field to search users!',
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: searchController.trazeniUser.length,
                itemBuilder: (context, index) {
                  MojUser user = searchController.trazeniUser[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePicture),
                    ),
                    title: Text(user.name),
                    onTap: () {
                      Get.snackbar("Processing to ${user.name}",
                          "Opening profile page in process!");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(uid: user.uid)));
                    },
                  );
                },
              ),
      );
    });
  }
}
