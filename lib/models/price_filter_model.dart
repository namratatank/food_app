import 'package:equatable/equatable.dart';
import 'package:food_app/models/price_model.dart';

class PriceFilter extends Equatable {
  final int id;
  final PriceModel priceModel;
  final bool value;

  const PriceFilter(
      {required this.id, required this.priceModel, required this.value});

  PriceFilter copyWith({int? id, PriceModel? priceModel, bool? value}) {
    return PriceFilter(
        id: id ?? this.id,
        priceModel: priceModel ?? this.priceModel,
        value: value ?? this.value);
  }

  @override
  List<Object?> get props => [id, priceModel, value];

  static List<PriceFilter> priceFilters = PriceModel.prices
      .map(
          (price) => PriceFilter(id: price.id, priceModel: price, value: false))
      .toList();
}
