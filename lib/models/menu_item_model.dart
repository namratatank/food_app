import 'package:equatable/equatable.dart';

class MenuItemModel extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  const MenuItemModel(
      {required this.id,
      required this.restaurantId,
      required this.name,
        required this.category,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
    category,
        description,
        price,
      ];

  static List<MenuItemModel> menuItems = [
    const MenuItemModel(
      id: 1,
      restaurantId: 1,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Pizza with cheese',
      price: 249,
    ),
    const MenuItemModel(
      id: 2,
      restaurantId: 1,
      name: 'cheesy seven',
      category: 'Pizza',
      description: 'Pizza with cheese toppings',
      price: 399,
    ),
    const MenuItemModel(
      id: 3,
      restaurantId: 1,
      name: 'Italian',
      category: 'Pizza',
      description: 'Tomatoes, Mozzarella, Basil',
      price: 349,
    ),
    const MenuItemModel(
      id: 4,
      restaurantId: 1,
      name: 'Coca cola',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 69,
    ),
    const MenuItemModel(
      id: 5,
      restaurantId: 1,
      name: 'Ice cream',
      category: 'Dessert',
      description: 'Sweet dish',
      price: 99,
    ),
    const MenuItemModel(
      id: 6,
      restaurantId: 4,
      name: 'Thumsup',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 69,
    ),
    const MenuItemModel(
      id: 7,
      restaurantId: 2,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Pizza with cheese',
      price: 249,
    ),
    const MenuItemModel(
      id: 7,
      restaurantId: 2,
      name: 'Thumsup',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 69,
    ),
    const MenuItemModel(
      id: 2,
      restaurantId: 2,
      name: 'cheesy seven',
      category: 'Pizza',
      description: 'Pizza with cheese toppings',
      price: 399,
    ),
    const MenuItemModel(
      id: 2,
      restaurantId: 3,
      name: 'cheesy seven',
      category: 'Pizza',
      description: 'Pizza with cheese toppings',
      price: 399,
    ),
    const MenuItemModel(
      id: 3,
      restaurantId: 3,
      name: 'Italian',
      category: 'Pizza',
      description: 'Tomatoes, Mozzarella, Basil',
      price: 349,
    ),
    const MenuItemModel(
      id: 3,
      restaurantId: 3,
      name: 'Vegetable salad',
      category: 'Salad',
      description: 'Contains all green vegetables',
      price: 149,
    ),
    const MenuItemModel(
      id: 7,
      restaurantId: 3,
      name: 'Thumsup',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 69,
    ),
    const MenuItemModel(
      id: 7,
      restaurantId: 4,
      name: 'Thumsup',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 69,
    ),
    const MenuItemModel(
      id: 5,
      restaurantId: 4,
      name: 'Pepsi',
      category: 'Drinks',
      description: 'A cold beverage',
      price: 69,
    ),
    const MenuItemModel(
      id: 5,
      restaurantId: 4,
      name: 'Maharaja burger',
      category: 'Burger',
      description: 'A big size burger',
      price: 149,
    ),
  ];
}
