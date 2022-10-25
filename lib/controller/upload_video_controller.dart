import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart';

import 'package:get/get.dart';
import 'package:tiktok/model/video.dart';
import 'package:tiktok/view/screens/home_screen.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  // Future selectVideo() async {
  //   final result = await FilePicker.platform.pickFiles();

  //   if (result == null) return;
  // }

  _kompresVidea(String videoLocation) async {
    final kompresianVideo = await VideoCompress.compressVideo(videoLocation,
        quality: VideoQuality.MediumQuality);
    return kompresianVideo!.file;
  }

  Future<String> upoladVideoToFirebase(String id, String videoLocation) async {
    Reference ref = FirebaseStorage.instance.ref().child('videos').child(id);

    UploadTask upoladVideoTask =
        ref.putFile(await _kompresVidea(videoLocation));
    TaskSnapshot snap = await upoladVideoTask;
    String videoUrl = await snap.ref.getDownloadURL();
    return videoUrl;
  }

  getThumbnail(String videoLocation) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoLocation);
    return thumbnail;
  }

  Future<String> upoladVideoThumbnail(String id, String videoLocation) async {
    Reference ref =
        FirebaseStorage.instance.ref().child('thumbnails').child(id);

    UploadTask upoladVideoTask = ref.putFile(await getThumbnail(videoLocation));
    TaskSnapshot snap = await upoladVideoTask;
    String videoUrl = await snap.ref.getDownloadURL();
    return videoUrl;
  }

  uploadVideo(String naslov, String videoLoaction) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      //dohvatanje id od videa

      var allData = await FirebaseFirestore.instance.collection('videos').get();
      int len = allData.docs.length;
      String videoLink =
          await upoladVideoToFirebase("Video $len", videoLoaction);

      //dobijanje tambnejla

      String thumbnail =
          await upoladVideoThumbnail("Video $len", videoLoaction);

      Video video = Video(
        name: (userData.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        likes: 0,
        commentCount: 0,
        videoUrl: videoLink,
        thumbnail: thumbnail,
        profilePicture:
            (userData.data()! as Map<String, dynamic>)['profilePictures'],
        naslov: naslov,
        id: "Video $len",
      );

      await FirebaseFirestore.instance
          .collection("videos")
          .doc("Video $len")
          .set(video.toJson());
      Get.to(() => const HomeScreen());
      Get.snackbar("Success", "Your video has been upoladed to TikTokClone!");
    } catch (e) {
      Get.snackbar("Error while uploading video", e.toString());
    }
  }
}
