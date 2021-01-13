import 'package:chefzone/models/categoriesModel.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.size,
    this.category,
    this.cardColor,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final Category category;
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
            height: size.width * 0.48,
            width: size.width * 0.4,
            margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: cardColor),
            child: Image.network(category.strCategoryThumb),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: category.strCategory + '\n',
                style: Theme.of(context).textTheme.bodyText1,
                children: <TextSpan>[
                  TextSpan(
                    text: category.idCategory,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
