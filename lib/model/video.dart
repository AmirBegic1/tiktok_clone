import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String name;
  String uid;
  List likes;
  int commentCount;
  String videoUrl;
  String thumbnail;
  String profilePicture;
  String id;
  String naslov;

  Video({
    required this.name,
    required this.uid,
    required this.likes,
    required this.commentCount,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePicture,
    required this.naslov,
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "likes": likes,
        "commentCount": commentCount,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "profilePictures": profilePicture,
        "naslov": naslov,
        "id": id,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      name: snapshot['name'],
      uid: snapshot['uid'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      videoUrl: snapshot['videoUrl'],
      thumbnail: snapshot['thumbnail'],
      profilePicture: snapshot['profilePictures'],
      naslov: snapshot['naslov'],
      id: snapshot['id'],
    );
  }
}
