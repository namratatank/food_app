part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();
  @override
  List<Object> get props => [];
}

class StartBasket extends BasketEvent{
  @override
  List<Object> get props => [];
}

class AddItemToBasket extends BasketEvent{
  final MenuItemModel menuItemModel;

  const AddItemToBasket({required this.menuItemModel});

  @override
  List<Object> get props => [menuItemModel];

}

class RemoveItemFromBasket extends BasketEvent{
  final MenuItemModel menuItemModel;

  const RemoveItemFromBasket({required this.menuItemModel});

  @override
  List<Object> get props => [menuItemModel];

}

class RemoveAllItemFromBasket extends BasketEvent{
  final MenuItemModel menuItemModel;

  const RemoveAllItemFromBasket({required this.menuItemModel});

  @override
  List<Object> get props => [menuItemModel];

}

class ToggleSwitch extends BasketEvent{
  @override
  List<Object> get props => [];
}

class AddVoucher extends BasketEvent{
  final VoucherModel voucherModel;

  const AddVoucher(this.voucherModel);

  @override
  List<Object> get props => [voucherModel];

}

class SelectDeliveryTime extends BasketEvent{
  final DeliveryTimeModel deliveryTimeModel;

  const SelectDeliveryTime(this.deliveryTimeModel);
  @override
  List<Object> get props => [deliveryTimeModel];
}
