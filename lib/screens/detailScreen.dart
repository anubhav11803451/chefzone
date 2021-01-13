import 'package:chefzone/controllers/authController.dart';
import 'package:chefzone/controllers/remoteController.dart';
import 'package:chefzone/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: body(context));
  }

  body(BuildContext context) {
    return GetX<RemoteServiceController>(
      init: RemoteServiceController(),
      builder: (_) {
        if (_.isLoading.value == false) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: Get.height * 0.3,
                            child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  height: Get.width * 0.6,
                                  width: Get.width * 0.6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green[200].withOpacity(0.3),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    _.detailsMeal[index].strMealThumb,
                                    height: 210,
                                    width: 180,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Text(
                            _.detailsMeal[index].strMeal,
                            style: Get.textTheme.headline5,
                          ),
                          Text(
                            _.detailsMeal[index].strCategory +
                                (_.detailsMeal[index].strTags),
                            style: Get.textTheme.caption,
                          ),
                          Text(
                            _.detailsMeal[index].strArea,
                            style: Get.textTheme.bodyText1,
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              Database().addFav(
                                  _.detailsMeal[index].strMeal,
                                  _.detailsMeal[index].strMealThumb,
                                  Get.find<AuthController>().user.uid);
                            },
                          ),
                          Text(
                            "\nHow to make\n",
                            style: Get.textTheme.headline6,
                          ),
                          Text(
                            _.detailsMeal[index].strInstructions,
                            style: Get.textTheme.bodyText2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "\nIngredients With Measure",
                                style: Get.textTheme.headline6,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient1),
                                  Text(_.detailsMeal[index].strMeasure1)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient2),
                                  Text(_.detailsMeal[index].strMeasure2)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient3),
                                  Text(_.detailsMeal[index].strMeasure3)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient4),
                                  Text(_.detailsMeal[index].strMeasure4)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient5),
                                  Text(_.detailsMeal[index].strMeasure5)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient6),
                                  Text(_.detailsMeal[index].strMeasure6)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient7),
                                  Text(_.detailsMeal[index].strMeasure7)
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(_.detailsMeal[index].strIngredient8),
                                  Text(_.detailsMeal[index].strMeasure8)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
