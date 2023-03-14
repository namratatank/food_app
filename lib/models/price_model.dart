import 'package:equatable/equatable.dart';

class PriceModel extends Equatable{
  final int id;
  final String price;

  const PriceModel({required this.id, required this.price});

  @override
  List<Object?> get props => [id, price];

  static List<PriceModel> prices = const[
    PriceModel(id: 1, price: '\u{20B9}'),
    PriceModel(id: 2, price: '\u{20B9}\u{20B9}'),
    PriceModel(id: 3, price: '\u{20B9}\u{20B9}\u{20B9}'),
  ];
}