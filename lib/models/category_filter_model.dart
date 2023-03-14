import 'package:equatable/equatable.dart';
import 'package:food_app/models/models.dart';

class CategoryFilter extends Equatable {
  final int id;
  final CategoryModel categoryModel;
  final bool value;

  const CategoryFilter(
      {required this.id, required this.categoryModel, required this.value});

  CategoryFilter copyWith(
      {int? id, CategoryModel? categoryModel, bool? value}) {
    return CategoryFilter(
        id: id ?? this.id,
        categoryModel: categoryModel ?? this.categoryModel,
        value: value ?? this.value);
  }

  static List<CategoryFilter> categoryFilters = CategoryModel.categories
      .map((category) => CategoryFilter(
          id: category.id, categoryModel: category, value: false))
      .toList();

  @override
  List<Object?> get props => [id, categoryModel, value];
}
