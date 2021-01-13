import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name, email, photoUrl;
  Timestamp accountCreated;

  UserModel(
      {this.uid, this.name, this.email, this.accountCreated, this.photoUrl});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    uid = documentSnapshot.id;
    name = documentSnapshot["name"];
    email = documentSnapshot["email"];
    photoUrl = documentSnapshot["photoUrl"];
    accountCreated = documentSnapshot["accountCreated"];
  }
}
