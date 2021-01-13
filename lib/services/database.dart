import 'package:chefzone/models/favModel.dart';
import 'package:chefzone/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewuser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'photoUrl': user.photoUrl,
        'accountCreated': Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection('users').doc(uid).get();
      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addFav(String name, String thumb, String uid) async {
    try {
      await _firestore.collection('users').doc(uid).collection('favs').add({
        'name': name,
        'thumb': thumb,
        'isFav': true,
      });
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Stream<List<FavMealModel>> favStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("favs")
        .snapshots()
        .map((QuerySnapshot query) {
      List<FavMealModel> retVal = List();
      query.docs.forEach((element) {
        retVal.add(FavMealModel.fromDocumentSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> deleteFav(String favmealId, String uid) async {
    try {
      _firestore
          .collection("users")
          .doc(uid)
          .collection("favs")
          .doc(favmealId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }
}
