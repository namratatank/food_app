import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';

import '../models/voucher_model.dart';
import '../widgets/custom_appbar.dart';
import 'home_screen.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const BasketScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: 'Basket',
          actionButton: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/edit-basket');
              },
              icon: const Icon(Icons.edit)),
        ),
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
                      'Go to checkout',
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
                  'Cutlery',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Do you need cutlery?',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is BasketLoaded) {
                            return Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                  value: state.basketModel.cutlery,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (value) {
                                    context
                                        .read<BasketBloc>()
                                        .add(ToggleSwitch());
                                  }),
                            );
                          } else {
                            return const Text('Something went wrong');
                          }
                        },
                      ),
                    ],
                  ),
                ),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
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
                                              .headline5),
                                    ],
                                  ),
                                );
                              });
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/delivery_time.svg'),
                      const SizedBox(width: 20),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoaded) {
                            return state.basketModel.deliveryTimeModel == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Delivery in 20 minutes',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/delivery-time');
                                        },
                                        child: Text(
                                          'Change',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Delivery at ${state.basketModel.deliveryTimeModel?.value}', style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ,),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          state.basketModel.deliveryTimeModel = null;
                                        });
                                      },
                                      child: Text(
                                        'Remove',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            ?.copyWith(
                                          color: Theme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                          } else {
                            return const Text('Something went wrong');
                          }
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoaded) {
                            return state.basketModel.voucherModel == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Do you have a voucher?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/voucher');
                                        },
                                        child: Text(
                                          'Apply',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Your voucher ${state.basketModel.voucherModel?.code} is applied',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        'You have saved \u{20B9}${state.basketModel.voucherModel?.value}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      const SizedBox(height: 5),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            state.basketModel.voucherModel =
                                                null;
                                          });
                                        },
                                        child: Text(
                                          'Remove',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                          } else {
                            return const Text('Something went wrong');
                          }
                        },
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                          child: SvgPicture.asset(
                              'assets/images/delivery_time.svg')),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                      if (state is BasketLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is BasketLoaded) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '\u{20B9}${state.basketModel.subTotalString}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery fee',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '\u{20B9}49',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                                Text(
                                  '\u{20B9}${state.basketModel.totalString}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            )
                          ],
                        );
                      } else {
                        return const Text('Something went wrong');
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
