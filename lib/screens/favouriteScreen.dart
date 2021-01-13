import 'package:chefzone/controllers/authController.dart';
import 'package:chefzone/controllers/favController.dart';
import 'package:chefzone/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }

  body(BuildContext context) {
    return GetX<FavController>(
      init: FavController(),
      builder: (_) {
        if (_ != null) {
          return ListView.builder(
            itemCount: _.favmeals.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(_.favmeals[index].name),
                  leading: Image.network(_.favmeals[index].thumb),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Database().deleteFav(_.favmeals[index].favmealId,
                          Get.find<AuthController>().user.uid);
                    },
                  ),
                ),
              );
            },
          );
          ;
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
