import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  final Image image;

  const CategoryModel({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];

 static List<CategoryModel> categories = [
    CategoryModel(
      id: 1,
      name: 'Pizza',
      image: Image.asset('assets/images/pizza.png'),
    ),
    CategoryModel(
      id: 2,
      name: 'Burger',
      image: Image.asset('assets/images/burger.png'),
    ),
    CategoryModel(
      id: 3,
      name: 'Salad',
      image: Image.asset('assets/images/avocado.png'),
    ),
    CategoryModel(
      id: 4,
      name: 'Dessert',
      image: Image.asset('assets/images/pancake.png'),
    ),
    CategoryModel(
      id: 5,
      name: 'Drinks',
      image: Image.asset('assets/images/juice.png'),
    ),
  ];
}
