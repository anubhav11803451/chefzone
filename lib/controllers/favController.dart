import 'package:chefzone/controllers/authController.dart';
import 'package:chefzone/models/favModel.dart';
import 'package:chefzone/services/database.dart';
import 'package:get/get.dart';

class FavController extends GetxController {
  Rx<List<FavMealModel>> favList = Rx<List<FavMealModel>>();

  List<FavMealModel> get favmeals => favList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user.uid;
    favList.bindStream(Database().favStream(uid)); //stream coming from firebase
  }
}
