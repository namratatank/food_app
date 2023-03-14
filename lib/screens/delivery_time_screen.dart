import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/models/delivery_time_model.dart';
import 'package:food_app/widgets/widgets.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);
  static const String routeName = '/delivery-time';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const DeliveryTimeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: 'Delivery Time'),
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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose a date',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Today',
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Tomorrow',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Choose the Time',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, childAspectRatio: 2.5),
                    itemCount: DeliveryTimeModel.deliveryTimes.length,
                    itemBuilder: (context, index) {
                      return BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          return Card(
                            child: Center(
                              child: TextButton(
                                  onPressed: () {
                                    context.read<BasketBloc>().add(
                                        SelectDeliveryTime(DeliveryTimeModel
                                            .deliveryTimes[index]));
                                  },
                                  child: Text(
                                    DeliveryTimeModel
                                        .deliveryTimes[index].value,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
