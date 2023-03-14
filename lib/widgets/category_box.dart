import 'package:flutter/material.dart';

import '../models/models.dart';

class CategoryBox extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryBox({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RestaurantModel> restaurants = RestaurantModel.restaurants
        .where((element) => element.tags.contains(categoryModel.name))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/restaurant-list',
          arguments: restaurants,
        );
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                height: 50,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: categoryModel.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    categoryModel.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
