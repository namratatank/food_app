import 'package:flutter/material.dart';
import 'package:food_app/models/models.dart';
import 'package:food_app/widgets/widgets.dart';

class RestaurantInformation extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantInformation({Key? key, required this.restaurantModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurantModel.name,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          const SizedBox(height: 10),
          RestaurantTags(restaurantModel: restaurantModel),
          const SizedBox(height: 5),
          Text(
            '${restaurantModel.distance} km - \u{20B9}${restaurantModel.deliveryFee} delivery fee',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 5),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
