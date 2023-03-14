import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app/models/models.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>(_onStartBasket);
    on<AddItemToBasket>(_onAddItemToBasket);
    on<RemoveItemFromBasket>(_onRemoveItemFromBasket);
    on<RemoveAllItemFromBasket>(_onRemoveAllItemFromBasket);
    on<ToggleSwitch>(_onToggleSwitch);
    on<AddVoucher>(_onAddVoucher);
    on<SelectDeliveryTime>(_onSelectDeliveryTime);
  }

  void _onStartBasket(
    StartBasket event,
    Emitter<BasketState> emit,
  ) async {
    emit(BasketLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(BasketLoaded(basketModel: BasketModel()));
    } catch (_) {}
  }

  void _onAddItemToBasket(
    AddItemToBasket event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basketModel: state.basketModel.copyWith(
                items: List.from(state.basketModel.items)
                  ..add(event.menuItemModel))));
      } catch (_) {}
    }
  }

  void _onRemoveItemFromBasket(
    RemoveItemFromBasket event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basketModel: state.basketModel.copyWith(
                items: List.from(state.basketModel.items)
                  ..remove(event.menuItemModel))));
      } catch (_) {}
    }
  }

  void _onRemoveAllItemFromBasket(
    RemoveAllItemFromBasket event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basketModel: state.basketModel.copyWith(
                items: List.from(state.basketModel.items)
                  ..removeWhere((element) => element == event.menuItemModel))));
      } catch (_) {}
    }
  }

  void _onToggleSwitch(
    ToggleSwitch event,
    Emitter<BasketState> emit,
  ) {
    final state = this.state;
    if (state is BasketLoaded) {
      emit(BasketLoaded(
          basketModel:
              state.basketModel.copyWith(cutlery: !state.basketModel.cutlery)));
    }
  }

  void _onAddVoucher(
      AddVoucher event,
      Emitter<BasketState> emit,
      ) {
    final state = this.state;
    if (state is BasketLoaded) {
      emit(BasketLoaded(
          basketModel:
          state.basketModel.copyWith(voucherModel: event.voucherModel)));
    }
  }

  void _onSelectDeliveryTime(
      SelectDeliveryTime event,
      Emitter<BasketState> emit,
      ) {
    final state = this.state;
    if (state is BasketLoaded) {
      emit(BasketLoaded(
          basketModel:
          state.basketModel.copyWith(deliveryTimeModel: event.deliveryTimeModel)));
    }
  }
}
