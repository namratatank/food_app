import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/widgets/widgets.dart';

import '../blocs/basket/basket_bloc.dart';
import 'basket_screen.dart';
import 'home_screen.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({Key? key}) : super(key: key);
  static const String routeName = '/edit-basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const EditBasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Edit Basket'),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Done',
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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Items',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is BasketLoaded) {
                      return state.basketModel.items.length == 0
                          ? Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('No items in the basket',
                                  style: Theme.of(context).textTheme.headline6),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.basketModel
                                  .itemQuantity(state.basketModel.items)
                                  .keys
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.only(right: 10, left: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${state.basketModel.itemQuantity(state.basketModel.items).entries.elementAt(index).value}x',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                            '${state.basketModel.itemQuantity(state.basketModel.items).keys.elementAt(index).name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                      ),
                                      Text(
                                        '\u{20B9} ${state.basketModel.itemQuantity(state.basketModel.items).keys.elementAt(index).price}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                          onPressed: () {
                                            context.read<BasketBloc>()
                                              .add(RemoveAllItemFromBasket(
                                                  menuItemModel: state
                                                      .basketModel
                                                      .itemQuantity(state
                                                          .basketModel.items)
                                                      .keys
                                                      .elementAt(index)));
                                          },
                                          visualDensity: VisualDensity.compact,
                                          icon: Icon(
                                            Icons.delete,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            context.read<BasketBloc>()
                                                .add(RemoveItemFromBasket(
                                                menuItemModel: state
                                                    .basketModel
                                                    .itemQuantity(state
                                                    .basketModel.items)
                                                    .keys
                                                    .elementAt(index)));
                                          },
                                          visualDensity: VisualDensity.compact,
                                          icon: Icon(
                                            Icons.remove_circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            context.read<BasketBloc>()
                                                .add(AddItemToBasket(
                                                menuItemModel: state
                                                    .basketModel
                                                    .itemQuantity(state
                                                    .basketModel.items)
                                                    .keys
                                                    .elementAt(index)));
                                          },
                                          visualDensity: VisualDensity.compact,
                                          icon: Icon(
                                            Icons.add_circle,
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                    ],
                                  ),
                                );
                              });
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
