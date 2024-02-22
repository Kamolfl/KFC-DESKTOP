part of 'second_categories_listview_bloc.dart';

@immutable
abstract class SecondCategoriesListviewState {}

class SecondCategoriesListviewInitial extends SecondCategoriesListviewState {}

class SecondCategoriesListviewLoadingState extends SecondCategoriesListviewState {}

class SecondCategoriesListviewSelectedIndexState extends SecondCategoriesListviewState {
  final int selectedIndex;
  final List<SecondCategoriesModel> secondCategoriesModel;
  SecondCategoriesListviewSelectedIndexState({required this.selectedIndex, required this.secondCategoriesModel});
}

class SecondCategoriesListviewError extends SecondCategoriesListviewState {
  final String error;
  SecondCategoriesListviewError({required this.error});
}
