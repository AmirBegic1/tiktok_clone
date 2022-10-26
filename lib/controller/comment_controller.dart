import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../model/comments.dart';

class CommentController extends GetxController {
  final Rx<List<Comments>> _comments = Rx<List<Comments>>([]);
  List<Comments> get comments => _comments.value;

  // ignore: non_constant_identifier_names
  String _IdPosta = "";

  updateIdOdPosta(String id) {
    _IdPosta = id;
    getComment();
  }

  getComment() async {
    _comments.bindStream(FirebaseFirestore.instance
        .collection('videos')
        .doc(_IdPosta)
        .collection('comments')
        .snapshots()
        .map((QuerySnapshot query) {
      List<Comments> returnValue = [];
      for (var element in query.docs) {
        returnValue.add(Comments.fromFirebase(element));
      }
      return returnValue;
    }));
  }

  postComment(String text) async {
    try {
      if (text.isNotEmpty) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        var allData = await FirebaseFirestore.instance
            .collection('videos')
            .doc(_IdPosta)
            .collection('comments')
            .get();

        int len = allData.docs.length;

        Comments comment = Comments(
          username: (userData.data()! as dynamic)['name'],
          comment: text.trim(),
          likes: [],
          profilePicture: (userData.data()! as dynamic)['profilePictures'],
          uid: FirebaseAuth.instance.currentUser!.uid,
          id: 'Comment $len',
          date: DateTime.now(),
        );
        await FirebaseFirestore.instance
            .collection('videos')
            .doc(_IdPosta)
            .collection('comments')
            .doc('Comment $len')
            .set(
              comment.toJson(),
            );
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('videos')
            .doc(_IdPosta)
            .get();

        await FirebaseFirestore.instance
            .collection('videos')
            .doc(_IdPosta)
            .update({
          'commentCount': (doc.data()! as dynamic)['commentCount'] + 1,
        });

        Get.snackbar(
            "Well done!", "Your comment has been added to this video!");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
