import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/screens/basket_screen.dart';

import '../models/restaurant_model.dart';
import '../widgets/widgets.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantDetailScreen({Key? key, required this.restaurantModel})
      : super(key: key);
  static const String routeName = '/restaurant-detail';

  static Route route({required RestaurantModel restaurantModel}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailScreen(
        restaurantModel: restaurantModel,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => const BasketScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Basket',
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 70)),
                    image: DecorationImage(
                        image: AssetImage(restaurantModel.imageURL),
                        fit: BoxFit.cover)),
              ),
              RestaurantInformation(
                restaurantModel: restaurantModel,
              ),
              ListView.builder(
                itemCount: restaurantModel.tags.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    _buildMenuItems(restaurantModel, context, index),
              )
            ],
          ),
        ));
  }

  _buildMenuItems(
      RestaurantModel restaurantModel, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurantModel.tags[index],
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
            children: restaurantModel.menuItem
                .where((element) =>
                    element.category == restaurantModel.tags[index])
                .map((menuItem) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            title: Text(
                              menuItem.name,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            subtitle: Text(
                              menuItem.description,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\u{20B9}${menuItem.price.toString()}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                BlocBuilder<BasketBloc, BasketState>(
                                  builder: (context, state) {
                                    return IconButton(
                                        onPressed: () {
                                          context.read<BasketBloc>().add(AddItemToBasket(menuItemModel: menuItem));
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Theme.of(context).primaryColor,
                                        ));
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        const Divider()
                      ],
                    ))
                .toList())
      ],
    );
  }
}
