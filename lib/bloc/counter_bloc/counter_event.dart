part of 'counter_bloc.dart';

@immutable
abstract class ShopEvent {}

class FoodVariantAddedEvent extends ShopEvent {
  FoodVariant? foodVariant;
}

class FoodVariantRemovedEvent extends ShopEvent {
  FoodVariant? foodVariant;

}

class IngredientAddedEvent extends ShopEvent {
  FoodVariant? foodVariant;
  Ingredient? ingredient;
}

class IngredientRemovedEvent extends ShopEvent {
  FoodVariant? foodVariant;
  Ingredient? ingredient;
}

class CounterDecrementEvent extends ShopEvent {}
