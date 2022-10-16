import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String name;
  String vid;

  Video({
    required this.name,
    required this.vid,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "vid": vid,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      name: snapshot['name'],
      vid: snapshot['vid'],
    );
  }
}
