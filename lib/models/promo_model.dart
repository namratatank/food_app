import 'package:equatable/equatable.dart';

class PromoModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageURL;

  const PromoModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageURL});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageURL,
      ];

  static List<PromoModel> promos = const[
    PromoModel(
      id: 1,
      title: 'FREE delivery on your first 3 orders',
      description:
          'Place an order of \u{20B9}299 or more and delivery fee is on us',
      imageURL: 'assets/images/food_two.jpeg',
    ),
    PromoModel(
      id: 2,
      title: '20% off on selected restaurants',
      description:
      'Get a discount at more than 200+ restaurants',
      imageURL: 'assets/images/food_two.jpeg',
    ),
  ];
}
