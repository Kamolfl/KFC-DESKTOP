import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kfc_desktop/models/second_categories_model.dart';
import 'package:meta/meta.dart';

part 'second_categories_listview_event.dart';
part 'second_categories_listview_state.dart';

class SecondCategoriesListviewBloc extends Bloc<SecondCategoriesListviewEvent, SecondCategoriesListviewState> {
  SecondCategoriesListviewBloc() : super(SecondCategoriesListviewInitial()) {
    on<SecondCategoriesListviewSelectCategoryEvent>((event, emit) {
      try{
        emit(SecondCategoriesListviewLoadingState());
        Future.delayed(const Duration(milliseconds: 300), () {
          emit(SecondCategoriesListviewSelectedIndexState(selectedIndex: event.selectedIndex, secondCategoriesModel: model));
        });      } catch(e) {
        emit(SecondCategoriesListviewError(error: e.toString()));
      }
    });
  }
}
