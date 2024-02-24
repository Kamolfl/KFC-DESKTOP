part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterNumberState extends CounterState {
  final int count;
  CounterNumberState({required this.count});
}

class FoodVariantAddedSuccessState extends CounterState{
  int? count;
  FoodVariant? foodVariant;
  FoodVariantAddedSuccessState(this.foodVariant,this.count);
}