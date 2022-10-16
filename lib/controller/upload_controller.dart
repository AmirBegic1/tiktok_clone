import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UpoladVideoController extends GetxController {
  final Rx<String> _vid = "".obs;

  // za upload

  uploadVideo() async {
    try {
      DocumentSnapshot videoDoc = await FirebaseFirestore.instance
          .collection("videos")
          .doc(_vid.value)
          .get();

      var allVideos =
          await FirebaseFirestore.instance.collection("videos").get();
    } catch (e) {}
  }
}
