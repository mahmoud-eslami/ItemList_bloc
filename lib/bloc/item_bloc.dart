import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:contact_list_bloc/page/splashpage.dart';
import './bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  @override
  ItemState get initialState => InitialState();

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if(event is AppStart) {
      await Future.delayed(Duration(seconds: 2));
      yield ItemLoading();
    }

    if (event is PressDeleteBtn) {
      yield ItemPop();
      await Future.delayed(Duration(seconds: 1));
      yield ItemLoading();
    }
  }
}
