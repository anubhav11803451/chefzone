import 'package:chefzone/controllers/userController.dart';
import 'package:chefzone/models/userModel.dart';
import 'package:chefzone/screens/root.dart';
import 'package:chefzone/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:google_sign_in/google_sign_in.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  firebaseAuth.FirebaseAuth _auth = firebaseAuth.FirebaseAuth.instance;

  Rx<firebaseAuth.User> _firebaseUser = Rx<firebaseAuth.User>();

  firebaseAuth.User get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void loginUserWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      GoogleSignInAccount _googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      final firebaseAuth.AuthCredential credential =
          firebaseAuth.GoogleAuthProvider.credential(
        idToken: _googleAuth.idToken,
        accessToken: _googleAuth.accessToken,
      );
      firebaseAuth.UserCredential _authResult =
          await _auth.signInWithCredential(credential);
      if (_authResult.additionalUserInfo.isNewUser) {
        UserModel _userModel = UserModel(
          uid: _authResult.user.uid,
          name: _authResult.user.displayName,
          email: _authResult.user.email,
          photoUrl: _authResult.user.photoURL,
        );
        if (await Database().createNewuser(_userModel)) {
          Get.find<UserController>().user = _userModel;
          Get.to(Root());
        }
      } else {
        Get.find<UserController>().user =
            await Database().getUser(_authResult.user.uid);
      }
    } catch (e) {
      print(e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      print(e);
    }
  }
}
