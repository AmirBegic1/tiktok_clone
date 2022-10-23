import 'package:cloud_firestore/cloud_firestore.dart';

class Comments {
  String username;
  String comment;
  List likes;
  String profilePicture;
  String uid;
  String id;
  final date;

  Comments({
    required this.username,
    required this.comment,
    required this.likes,
    required this.profilePicture,
    required this.uid,
    required this.id,
    required this.date,
  });

  //mapiranje komentara
  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'likes': likes,
        'profilePictures': profilePicture,
        'uid': uid,
        'id': id,
        'date': date,
      };

  //dohvatanje istog komentara preko snapa

  static Comments fromFirebase(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Comments(
      username: snapshot['username'],
      comment: snapshot['comment'],
      likes: snapshot['likes'],
      profilePicture: snapshot['profilePictures'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      date: snapshot['date'],
    );
  }
}
