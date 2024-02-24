import 'package:kfc_desktop/models/second_categories_model.dart';

class FoodVariant {
  final int? id;
  final String image;
  final String name;
  final int gram;
  final int calorie;
  final int price;
  final String? extraIngredient;
  final List<Ingredient>? ingredients;
  int count=0;

  FoodVariant({this.id, this.extraIngredient, this.ingredients, required this.image, required this.name, required this.gram, required this.calorie, required this.price});
}
