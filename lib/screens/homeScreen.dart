import 'package:chefzone/controllers/remoteController.dart';
import 'package:chefzone/controllers/userController.dart';
import 'package:chefzone/screens/mealsScreen.dart';
import 'package:chefzone/screens/favouriteScreen.dart';
import 'package:chefzone/screens/profileScreen.dart';
import 'package:chefzone/widgets/categoryCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  static int selectedIndex = 0;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomAppBar(context),
      body: body(context),
    );
  }

  bottomAppBar(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return Container(
      height: size.width * 0.153,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            color: Colors.green[200],
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      // margin: EdgeInsets.only(right: 10, left: 10),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              setState(() {
                HomeScreen.selectedIndex = 0;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              print(Get.find<UserController>().obs.value.user.name);
              setState(() {
                HomeScreen.selectedIndex = 1;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              setState(() {
                HomeScreen.selectedIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  body(BuildContext context) {
    return IndexedStack(
      index: HomeScreen.selectedIndex,
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Text("Discover", style: Get.textTheme.headline5),
              SizedBox(
                height: Get.width * 0.69,
                child: GetX<RemoteServiceController>(
                  init: RemoteServiceController(),
                  builder: (_) {
                    if (_.isLoading.value == false) {
                      return ListView.builder(
                        itemCount: _.categoriesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(
                            size: Get.mediaQuery.size,
                            cardColor: index.isEven
                                ? Color(0xffF1F2F6)
                                : Colors.green[300],
                            category: _.categoriesList[index],
                            onTap: () {
                              _.fetchMealsByCategories(
                                  _.categoriesList[index].strCategory);
                              Get.to(MealsScreen());
                            },
                          );
                        },
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        FavouriteScreen(),
        ProfileScreen(),
      ],
    );
  }
}
