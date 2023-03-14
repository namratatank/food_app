import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filter/filter_bloc.dart';


class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filterModel.priceFilters
                .asMap()
                .entries
                .map((e) => InkWell(
                      onTap: () {
                        context.read<FilterBloc>().add(PriceFilterUpdated(
                            priceFilter: state.filterModel.priceFilters[e.key]
                                .copyWith(
                                    value: !state.filterModel
                                        .priceFilters[e.key].value)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        decoration: BoxDecoration(
                            color: state.filterModel.priceFilters[e.key].value
                                ? Theme.of(context).primaryColor.withAlpha(100)
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10.0,
                              ),
                            ]),
                        child: Text(
                          state
                              .filterModel.priceFilters[e.key].priceModel.price,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ))
                .toList(),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
