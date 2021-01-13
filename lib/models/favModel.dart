import 'package:cloud_firestore/cloud_firestore.dart';

class FavMealModel {
  String favmealId;
  String name, thumb;
  bool isFav;

  FavMealModel({this.favmealId, this.name, this.thumb, this.isFav});

  FavMealModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    favmealId = documentSnapshot.id;
    name = documentSnapshot["name"];
    thumb = documentSnapshot["thumb"];
    isFav = documentSnapshot["isFav"];
  }
}
