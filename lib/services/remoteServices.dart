import 'package:chefzone/models/categoriesModel.dart';
import 'package:chefzone/models/detailMealModel.dart';
import 'package:chefzone/models/mealsModel.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<Categories> fetchCategories() async {
    final response = await client
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');
    if (response.statusCode == 200) {
      print("categories remote" + response.body);
      return categoriesFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Meals> fetchMealsByCategory(String category) async {
    final response = await client
        .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    if (response.statusCode == 200) {
      print("mealsbycat remote" + response.body);
      return mealsFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<Details> fetchMealDetails(String id) async {
    final response = await client
        .get('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id');
    if (response.statusCode == 200) {
      print("mealsdetails remote" + response.body);
      return detailsFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
