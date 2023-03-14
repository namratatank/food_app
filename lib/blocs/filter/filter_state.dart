part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final FilterModel filterModel;

  const FilterLoaded({this.filterModel = const FilterModel()});

  @override
  List<Object> get props => [filterModel];
}
