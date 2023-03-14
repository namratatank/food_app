

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<FilterLoad>(_onFilterLoad);
    on<CategoryFilterUpdated>(_onCategoryFilterUpdated);
    on<PriceFilterUpdated>(_onPriceFilterUpdated);
  }

  void _onFilterLoad(FilterLoad event, Emitter<FilterState> emit) async {
    emit(
      FilterLoaded(
        filterModel: FilterModel(
            categoryFilters: CategoryFilter.categoryFilters,
            priceFilters: PriceFilter.priceFilters),
      ),
    );
  }

  void _onCategoryFilterUpdated(
      CategoryFilterUpdated event, Emitter<FilterState> emit) async {
    final state = this.state;
    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilter = state
          .filterModel.categoryFilters
          .map(
              (e) => e.id == event.categoryFilter.id ? event.categoryFilter : e)
          .toList();

      emit(
        FilterLoaded(
          filterModel: FilterModel(
              categoryFilters: updatedCategoryFilter,
              priceFilters: state.filterModel.priceFilters),
        ),
      );
    }
  }

  void _onPriceFilterUpdated(
      PriceFilterUpdated event, Emitter<FilterState> emit) async {
    final state = this.state;
    if (state is FilterLoaded) {
      final List<PriceFilter> updatedPriceFilter = state
          .filterModel.priceFilters
          .map(
              (e) => e.id == event.priceFilter.id ? event.priceFilter : e)
          .toList();

      emit(
        FilterLoaded(
          filterModel: FilterModel(
              categoryFilters: state.filterModel.categoryFilters,
              priceFilters:updatedPriceFilter),
        ),
      );
    }
  }
}
