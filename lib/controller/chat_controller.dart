import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../model/user.dart';

class ChatController extends GetxController {
  final Rx<List<MojUser>> _profiles = Rx<List<MojUser>>([]);

  List<MojUser> get chatuser => _profiles.value;

  chatUser() async {
    _profiles.bindStream(FirebaseFirestore.instance
        .collection('users')
        .where('name')
        .snapshots()
        .map((QuerySnapshot rezultatPRofila) {
      List<MojUser> returnValue = [];
      for (var element in rezultatPRofila.docs) {
        returnValue.add(MojUser.fromSnapshot(element));
      }
      return returnValue;
    }));
  }
}
