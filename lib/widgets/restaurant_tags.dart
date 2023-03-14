import 'package:flutter/material.dart';
import 'package:food_app/models/models.dart';

class RestaurantTags extends StatelessWidget {
  final RestaurantModel restaurantModel;
  const RestaurantTags({Key? key, required this.restaurantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restaurantModel.tags
          .map((tag) => restaurantModel.tags.indexOf(tag) ==
          restaurantModel.tags.length - 1
          ? Text(tag, style: Theme.of(context).textTheme.bodyText1,)
          : Text('$tag, ',style: Theme.of(context).textTheme.bodyText1,))
          .toList(),
    );
  }
}
