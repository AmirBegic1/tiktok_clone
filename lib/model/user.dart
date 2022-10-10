import 'package:cloud_firestore/cloud_firestore.dart';

class MojUser {
  String name;
  String profilePicture;
  String email;
  String uid;

  MojUser({
    required this.name,
    required this.profilePicture,
    required this.email,
    required this.uid,
  });

//iz aplikacije ka bazi(mapiranje)
  Map<String, dynamic> toJson() => {
        "name": name,
        "profilePictures": profilePicture,
        "email": email,
        "uid": uid,
      };
// i obrnuto
  static MojUser fromSnapshot(DocumentSnapshot snep) {
    var snapshot = snep.data() as Map<String, dynamic>;

    return MojUser(
      email: snapshot['email'],
      profilePicture: snapshot['profilePictures'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}
