import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class RestaurantModel extends Equatable {
  final int id;
  final String name;
  final String imageURL;
  final List<String> tags;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;
  final String priceCategory;
  final List<MenuItemModel> menuItem;

  const RestaurantModel(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.tags,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.distance,
        required this.priceCategory,
      required this.menuItem});

  @override
  List<Object?> get props => [
        id,
        name,
        imageURL,
        tags,
        deliveryTime,
        deliveryFee,
        distance,
        menuItem,
      ];

  static List<RestaurantModel> restaurants = [
    RestaurantModel(
      id: 1,
      name: "The Imperial Spice",
      imageURL: 'assets/images/restaurant_one.webp',
      tags: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 1)
          .map((menu) => menu.category)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 49,
      distance: 1.5,
      priceCategory: '\u{20B9}',
      menuItem: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 1)
          .toList(),
    ),
    RestaurantModel(
      id: 2,
      name: "The Indian Grill",
      imageURL: 'assets/images/restaurant_two.webp',
      tags: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 2)
          .map((menu) => menu.category)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 49,
      distance: 1.5,
      priceCategory: '\u{20B9}\u{20B9}',
      menuItem: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 2)
          .toList(),
    ),
    RestaurantModel(
      id: 3,
      name: "Shahi Darbar",
      imageURL: 'assets/images/restaurant_three.webp',
      tags: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 3)
          .map((menu) => menu.category)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 49,
      distance: 1.5,
      priceCategory: '\u{20B9}',
      menuItem: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 3)
          .toList(),
    ),
    RestaurantModel(
      id: 4,
      name: "The Maharaja Club",
      imageURL: 'assets/images/restaurant_four.jpeg',
      tags: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 4)
          .map((menu) => menu.category)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 49,
      distance: 1.5,
      priceCategory: '\u{20B9}\u{20B9}\u{20B9}',
      menuItem: MenuItemModel.menuItems
          .where((element) => element.restaurantId == 4)
          .toList(),
    ),
  ];
}
