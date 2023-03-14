import 'package:flutter/material.dart';
import 'package:food_app/widgets/custom_appbar.dart';
import 'package:food_app/widgets/widgets.dart';

import '../models/models.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<RestaurantModel> restaurantModel;

  const RestaurantListScreen({Key? key, required this.restaurantModel})
      : super(key: key);
  static const String routeName = '/restaurant-list';

  static Route route({required List<RestaurantModel> restaurantModel}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListScreen(
        restaurantModel: restaurantModel,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Restaurants'),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: restaurantModel.length,
              itemBuilder: (context, index) =>
                  RestaurantCard(restaurantModel: restaurantModel[index])),
        ));
  }
}
