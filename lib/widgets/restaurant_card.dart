import 'package:flutter/material.dart';
import 'package:food_app/widgets/widgets.dart';
import '../models/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantCard({Key? key, required this.restaurantModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantDetailScreen(restaurantModel: restaurantModel,)));
            Navigator.pushNamed(context, '/restaurant-detail',
                arguments: restaurantModel);
          },
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(restaurantModel.imageURL),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text('${restaurantModel.deliveryTime} min'),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          restaurantModel.name,
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 5),
        RestaurantTags(restaurantModel: restaurantModel),
        const SizedBox(height: 5),
        Text(
          '${restaurantModel.distance} km - \u{20B9}${restaurantModel.deliveryFee} delivery fee',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}