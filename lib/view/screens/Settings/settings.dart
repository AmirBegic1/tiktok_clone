import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/view/screens/auth/menu_auth_screens/menu_login.dart';
import 'package:tiktok/view/screens/profileScreens/profile.dart';

import '../../../controller/auth_controller.dart';
import '../../../controller/profil_controller.dart';
import '../../widgets/from.dart';

class Settigns extends StatefulWidget {
  const Settigns({Key? key}) : super(key: key);

  @override
  State<Settigns> createState() => _SettignsState();
}

class _SettignsState extends State<Settigns> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  final ProfilController profilController = Get.put(ProfilController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Change your credentials if you want",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LoginTextField(
                    controller: _usernameController,
                    myLabelText: "New username",
                    myIcon: Icons.person,
                    hide: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    onPressed: () async {
                      // await FirebaseAuth.instance.currentUser!
                      //     .updateDisplayName(_usernameController.text);
                      // Get.snackbar("Welldone", "Successfuly updates username ");
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size.fromHeight(10),
                        padding: const EdgeInsets.all(20)),
                    child: const Text('Change your username'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Or",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: LoginTextField(
                    controller: _emailController,
                    myLabelText: "Enter your email to change password",
                    myIcon: Icons.email,
                    hide: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailController.text)
                          .then((value) => Get.to(ProfileScreen(
                              uid: FirebaseAuth.instance.currentUser!.uid)));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size.fromHeight(10),
                        padding: const EdgeInsets.all(20)),
                    child: const Text('Change your password'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Or",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: "Are you sure? ",
                          middleText: "YOu will delete it forever!",
                          backgroundColor: Colors.grey,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(25),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text(
                                    'Delete account',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  onPressed: () async {
                                    AuthController.instance.deleteAccount();
                                    Get.snackbar("Success!",
                                        "You deleted your account!");
                                    Get.to(() => const MenuLogin());
                                  },
                                ),
                              ),
                            ],
                          ),
                          radius: 30);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size.fromHeight(10),
                        padding: const EdgeInsets.all(20)),
                    child: const Text('Delete your account'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
