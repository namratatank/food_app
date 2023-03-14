import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filter/filter_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({Key? key}) : super(key: key);

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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filterModel.categoryFilters.length,
            itemBuilder: (context, index) => Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.filterModel.categoryFilters[index].categoryModel.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                        value: state.filterModel.categoryFilters[index].value,
                        onChanged: (value) {
                          context.read<FilterBloc>().add(CategoryFilterUpdated(
                              categoryFilter: state
                                  .filterModel.categoryFilters[index]
                                  .copyWith(
                                      value: !state.filterModel
                                          .categoryFilters[index].value)));
                        }),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Text('Something went wrong');
        }
      },
    );
  }
}
