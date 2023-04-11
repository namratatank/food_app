import 'package:flutter/material.dart';
import 'package:food_app/models/models.dart';
import 'package:food_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: const Icon(Icons.person),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CURRENT LOCATION',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white),
            ),
            Text(
              'Ahmedabad, Iscon circle',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CategoryModel.categories.length,
                itemBuilder: (context, index) => CategoryBox(
                  categoryModel: CategoryModel.categories[index],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 125,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: PromoModel.promos.length,
                  itemBuilder: (context, index) => PromoBox(
                        promoModel: PromoModel.promos[index],
                      )),
            ),
          ),
          const FoodSearchBox(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Top Rated',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: RestaurantModel.restaurants.length,
                itemBuilder: (context, index) => RestaurantCard(
                  restaurantModel: RestaurantModel.restaurants[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
