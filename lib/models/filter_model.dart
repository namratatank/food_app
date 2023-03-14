import 'package:equatable/equatable.dart';

import 'models.dart';

class FilterModel extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PriceFilter> priceFilters;

  const FilterModel(
      {this.categoryFilters = const <CategoryFilter>[],
      this.priceFilters = const <PriceFilter>[]});

  FilterModel copyWith(
      {List<CategoryFilter>? categoryFilters, List<PriceFilter>? priceFilters}) {
    return FilterModel(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      priceFilters: priceFilters?? this.priceFilters,
    );
  }

  @override
  List<Object?> get props => [categoryFilters, priceFilters];
}
