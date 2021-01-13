import 'package:chefzone/controllers/authController.dart';
import 'package:chefzone/controllers/remoteController.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put<AuthController>(AuthController(), permanent: true);

    Get.lazyPut(() => RemoteServiceController());
    // Get.lazyPut(() => ScoreController());
  }
}
