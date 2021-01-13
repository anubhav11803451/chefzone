import 'package:chefzone/models/mealsModel.dart';
import 'package:flutter/material.dart';

class MealCards extends StatelessWidget {
  const MealCards({
    Key key,
    @required this.size,
    this.meal,
    this.cardColor,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final Meal meal;
  final Color cardColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.width * 0.35,
            width: size.width * 0.4,
            // margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(meal.strMealThumb), fit: BoxFit.cover),
            ),
            // child: Image.network(meal.strMealThumb),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: meal.strMeal + '\n',
                  style: Theme.of(context).textTheme.bodyText1,
                  children: <TextSpan>[
                    TextSpan(
                      text: meal.idMeal,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
