import 'package:chefzone/controllers/authController.dart';
import 'package:chefzone/controllers/userController.dart';
import 'package:chefzone/screens/homeScreen.dart';
import 'package:chefzone/screens/loginScreen.dart';
import 'package:chefzone/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController()).user =
            await Database().getUser(Get.find<AuthController>().user.uid);
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
