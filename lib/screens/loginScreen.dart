import 'package:chefzone/controllers/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              controller.loginUserWithGoogle();
            },
          ),
        ),
      ),
    );
  }
}
