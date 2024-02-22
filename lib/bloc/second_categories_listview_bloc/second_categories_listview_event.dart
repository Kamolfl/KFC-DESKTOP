part of 'second_categories_listview_bloc.dart';

@immutable
abstract class SecondCategoriesListviewEvent {}

class SecondCategoriesListviewSelectCategoryEvent extends SecondCategoriesListviewEvent {
  final int selectedIndex;
  SecondCategoriesListviewSelectCategoryEvent({required this.selectedIndex});
}
