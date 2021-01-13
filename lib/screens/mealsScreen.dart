import 'package:chefzone/controllers/remoteController.dart';
import 'package:chefzone/screens/detailScreen.dart';
import 'package:chefzone/widgets/mealCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetX<RemoteServiceController>(
              init: RemoteServiceController(),
              builder: (_) {
                if (_.isLoading.value == false) {
                  return GridView.builder(
                    itemCount: _.mealsList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _.fetchMealDetails(_.mealsList[index].idMeal);
                          Get.to(DetailScreen());
                        },
                        child: MealCards(
                            meal: _.mealsList[index],
                            size: Get.mediaQuery.size),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
