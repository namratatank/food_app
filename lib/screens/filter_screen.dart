import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filter/filter_bloc.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const FilterScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppbar(title: 'Filter'),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state is FilterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FilterLoaded) {
                  return ElevatedButton(
                    onPressed: () {
                      var categories = state.filterModel.categoryFilters
                          .where((element) => element.value)
                          .map((e) => e.categoryModel.name)
                          .toList();

                      var prices = state.filterModel.priceFilters
                          .where((element) => element.value)
                          .map((e) => e.priceModel.price)
                          .toList();

                      List<RestaurantModel> restaurants =
                          RestaurantModel.restaurants
                              .where(
                                (restaurant) => categories.any(
                                  (category) =>
                                      restaurant.tags.contains(category),
                                ),
                              )
                              .where(
                                (restaurant) => prices.any(
                                  (price) => restaurant.priceCategory.contains(price),
                                ),
                              )
                              .toList();

                      Navigator.pushNamed(context, '/restaurant-list',
                          arguments: restaurants);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Apply',
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            const CustomPriceFilter(),
            Text(
              'Categories',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            const CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
