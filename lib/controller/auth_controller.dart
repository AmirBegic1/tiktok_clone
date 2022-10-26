import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/model/user.dart';
import 'package:tiktok/view/screens/auth/menu_auth_screens/menu_login.dart';

import 'package:tiktok/view/screens/home_screen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  File? profilna;
  late Rx<User?> _user;
  //da ne bude nullable
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());

    ever(_user, _setInitialView);
  }

  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final img = File(image.path);
    profilna = img;
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => const MenuLogin());
    } else {
      Get.offAll(() => const HomeScreen());
    }
  }

  //registrovanje usera i logiranje funkcije!

  void signUp(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String imageUrl = await upoladPicture(image);

        MojUser user = MojUser(
          name: username,
          email: email,
          //provejritiiiiii!
          profilePicture: imageUrl,
          uid: credential.user!.uid,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
        Get.snackbar("Well done!", "Creating profile successful");
      } else {
        Get.snackbar(
            "Error while creating account", "Enter all fields with valid data");
      }
    } catch (e) {
      Get.snackbar("Error while creating profile", e.toString());
    }
  }

//za upload profilne slike korisnika!
  Future<String> upoladPicture(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePictures')
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();

    return imageUrl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        Get.snackbar("Successfuly logged in", "Feel free to use TikTok ");
      } else {
        Get.snackbar(
            "Error while logging in", "Please login valid credentials");
      }
    } catch (e) {
      Get.snackbar("Error while logging in", e.toString());
    }
  }

  Future<void> loginWithGoogle() async {}

  Future<void> logoutGoogle() async {}

  signOut() {
    FirebaseAuth.instance.signOut();
    Get.back();
  }
}
