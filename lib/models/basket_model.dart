import 'package:equatable/equatable.dart';
import 'package:food_app/models/models.dart';

class BasketModel extends Equatable {
  final List<MenuItemModel> items;
  final bool cutlery;
  VoucherModel? voucherModel;
  DeliveryTimeModel? deliveryTimeModel;

  BasketModel(
      {this.items = const <MenuItemModel>[],
      this.cutlery = false,
      this.voucherModel,
      this.deliveryTimeModel});

  BasketModel copyWith(
      {List<MenuItemModel>? items,
      bool? cutlery,
      VoucherModel? voucherModel,
      DeliveryTimeModel? deliveryTimeModel}) {
    return BasketModel(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
      voucherModel: voucherModel ?? this.voucherModel,
      deliveryTimeModel: deliveryTimeModel ?? this.deliveryTimeModel,
    );
  }

  @override
  List<Object?> get props => [items, cutlery, voucherModel, deliveryTimeModel];

  Map itemQuantity(items) {
    var quantity = Map();
    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subTotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subTotal) {
    return voucherModel == null
        ? subTotal + 49
        : subTotal + 49 - voucherModel?.value;
  }

  String get subTotalString => subTotal.toStringAsFixed(2);

  String get totalString => total(subTotal).toStringAsFixed(2);
}
