import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../model/video.dart';

class VideoController extends GetxController {
  final Rx<Map<String, dynamic>> _videoList = Rx<Map<String, dynamic>>({});

  Map<String, dynamic> get videoList => _videoList.value;
  final Rx<String> _vid = "".obs;

  updateUserId(String vid) {
    _vid.value = vid;
    getVideoData();
  }

  getVideoData() async {
    DocumentSnapshot videoDoc = await FirebaseFirestore.instance
        .collection("videos")
        .doc(_vid.value)
        .get();

    String name = videoDoc['name'];
    String vid = videoDoc['vid'];

    _videoList.value = {
      'name': name.toString(),
      'vid': vid.toString(),
    };

    update();
  }
}
