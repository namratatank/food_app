part of 'basket_bloc.dart';

abstract class BasketState extends Equatable {
  const BasketState();
}

class BasketLoading extends BasketState {
  @override
  List<Object> get props => [];
}

class BasketLoaded extends BasketState {
  final BasketModel basketModel;

  const BasketLoaded({required this.basketModel});

  @override
  List<Object> get props => [basketModel];
}
