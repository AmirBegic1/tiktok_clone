import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class ProfilController extends GetxController {
  final Rx<Map<String, dynamic>> _user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get user => _user.value;
  Rx<String> _uid = "".obs;

  updateUserId(String uid) {
    _uid.value = uid;
    getUsersVideosAndData();
  }
  //ne dohvata mi videa moram preko colletiona uporedit id sa userom i id koji se nalazi na videu
  // da mogu lakse indeksirat i povuc odgovrajuca videa za odgovarajuce profile odnosno usere

  getUsersVideosAndData() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .get();

    List<String> thumbnails = [];
    var mojVideo = await FirebaseFirestore.instance
        .collection('videos')
        .where('uid', isEqualTo: _uid.value)
        .get();

    for (int i = 0; i < mojVideo.docs.length; i++) {
      thumbnails.add((mojVideo.docs[i].data() as dynamic)['thumbnail']);
    }

    String name = userDoc['name'];
    String profilePicture = userDoc['profilePictures'];
    int likes = 0;
    int followers = 0;
    int following = 0;

    for (var item in mojVideo.docs) {
      likes += (item.data()['likes'] as List).length;
    }

    var followersNumber = await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .collection("followers")
        .get();
    var followingNumber = await FirebaseFirestore.instance
        .collection("users")
        .doc(_uid.value)
        .collection("following")
        .get();

    followers = followersNumber.docs.length;
    following = followingNumber.docs.length;

    _user.value = {
      'followers': followers.toString(),
      'following': following.toString(),
      'likes': likes.toString(),
      'profilePictures': profilePicture.toString(),
      'name': name.toString(),
      'thumbnails': thumbnails,
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
