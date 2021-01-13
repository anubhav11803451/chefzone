import 'package:chefzone/models/categoriesModel.dart';
import 'package:chefzone/models/detailMealModel.dart';
import 'package:chefzone/models/mealsModel.dart';
import 'package:chefzone/services/remoteServices.dart';
import 'package:get/get.dart';

class RemoteServiceController extends GetxController {
  RxBool isLoading = true.obs;

  var categoriesList = Categories().obs.value.categories;
  var mealsList = Meals().obs.value.meals;
  var detailsMeal = Details().obs.value.meals;

  @override
  void onInit() async {
    await fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      final categories = await RemoteServices.fetchCategories();
      if (categories != null) {
        categoriesList = categories.categories;
        // print('assigned' + meals.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchMealsByCategories(String cat) async {
    try {
      isLoading(true);
      final meals = await RemoteServices.fetchMealsByCategory(cat);
      if (meals != null) {
        mealsList = meals.meals;
        print('assigned mealsList' + mealsList.toString());
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchMealDetails(String id) async {
    try {
      isLoading(true);
      final mdetails = await RemoteServices.fetchMealDetails(id);
      if (mdetails != null) {
        detailsMeal = mdetails.meals;
        print('assigned details' + detailsMeal.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
