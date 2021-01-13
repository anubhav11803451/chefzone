import 'package:chefzone/controllers/authController.dart';
import 'package:chefzone/controllers/userController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetWidget<AuthController> {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetX<UserController>(
            init: UserController(),
            builder: (_) {
              if (_.user.name != null) {
                return Text(_.user.name);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              controller.signOut();
            },
          ),
        ],
      ),
    );
  }
}
