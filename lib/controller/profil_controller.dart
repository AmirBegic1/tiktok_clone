import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class ProfilController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get user => _user.value;
  final Rx<String> _uid = "".obs;

  updateUserId(String uid) {
    _uid.value = uid;
    getUserData();
  }

  getUserData() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .get();

    String name = userDoc['name'];
    String profilePicture = userDoc['profilePictures'];
    int likes = 0;
    int followers = 0;
    int following = 0;

    var followersDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .collection("followers")
        .get();
    var followingDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .collection("following")
        .get();

    followers = followersDoc.docs.length;
    following = followingDoc.docs.length;

    _user.value = {
      'followers': followers.toString(),
      'following': following.toString(),
      'likes': likes.toString(),
      'profilePictures': profilePicture.toString(),
      'name': name.toString(),
    };

    update();

    FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .collection("followers")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      if (value.exists) {
      } else {}
    });
  }
}
