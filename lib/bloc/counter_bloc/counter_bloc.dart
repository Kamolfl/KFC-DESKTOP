import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kfc_desktop/models/second_categories_model.dart';
import 'package:meta/meta.dart';

import '../../models/food_variant.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class ShopBloc extends Bloc<ShopEvent, CounterState> {
  Map<int, FoodVariant> selectedFoods = {};

  ShopBloc() : super(CounterInitial()) {
    on<FoodVariantAddedEvent>((event, emit) {
      if (selectedFoods.containsKey(event.foodVariant!.id!)) {
        selectedFoods[event.foodVariant!.id!]!.count++;
      } else {
        event.foodVariant!.count = 1;
        selectedFoods[event.foodVariant!.id!] = event.foodVariant!; //key=1, value foodVariant(osh)
      }
      emit(FoodVariantAddedSuccessState(
          event.foodVariant, selectedFoods[event.foodVariant!.id!]!.count));
    });
  }
}
