import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/profil_controller.dart';
import 'package:tiktok/view/screens/Settings/PrivacyScreen.dart';

import '../../../controller/auth_controller.dart';
import '../Settings/settings.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfilController profilController = Get.put(ProfilController());

  @override
  void initState() {
    super.initState();
    profilController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
      init: ProfilController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Profile",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
              actions: [
                Theme(
                  data: Theme.of(context).copyWith(
                    textTheme: const TextTheme().apply(bodyColor: Colors.white),
                    dividerColor: Colors.white,
                    iconTheme: const IconThemeData(color: Colors.white),
                  ),
                  child: PopupMenuButton<int>(
                    color: Colors.black,
                    itemBuilder: (context) => [
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                        value: 0,
                        child: Text("Settings"),
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem(
                        value: 1,
                        child: Text("Privacy Policy page"),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text("Logout")
                          ],
                        ),
                      ),
                      const PopupMenuDivider(),
                    ],
                    onSelected: ((item) => selectedItem(context, item)),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: '${controller.user['profilePictures']}',
                        fit: BoxFit.contain,
                        height: 100,
                        width: 100,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          color: Colors.red,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '@${controller.user["name"]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Text(
                                  '${controller.user['followers']}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  'Following',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${controller.user['following']}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Followers',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(
                                  '${controller.user['likes']}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  '  Likes  ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Get.to(() => const Settigns());
                            Get.snackbar("Going to settings page",
                                "Edit profile on settings page!");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: const Text(
                              'Edit profile',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 16),
                            child: const Icon(Icons.bookmark_add_outlined),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('bio dodat neki'),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      color: Colors.red,
                    ),
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6),
                        itemCount: controller.user['thumbnails'].length,
                        itemBuilder: (context, index) {
                          String thumbnail =
                              controller.user['thumbnails'][index];
                          return CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: thumbnail,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          );
                        })

                    //ovdje stavit ispisivanje videa!
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void selectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Settigns()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PrivacyScreen()),
        );
        break;
      case 2:
        AuthController.instance.signOut();
    }
  }
}
