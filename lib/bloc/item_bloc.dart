import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:contact_list_bloc/model/contact.dart';
import 'package:flutter/material.dart';
import './bloc.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  @override
  ItemState get initialState => InitialState();

  Color getRandomColor() {
    Random r = Random();
    var colorsList = Colors.primaries;
    return colorsList.elementAt(r.nextInt(colorsList.length - 1));
  }

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is AppStart) {
      yield ItemLoading();
      await Future.delayed(Duration(seconds: 2));

      final contactList = List<Contact>.generate(
          10,
          (i) => Contact(
              title: 'item$i',
              number: '0912312312$i',
              backgroundColor: getRandomColor()));

      yield ItemLoaded(contactList: contactList);
    } else if (event is DeleteItem) {
      var updatedList = event.contactList
          .where((items) => items != event.deletedItem)
          .toList();

      yield ItemLoaded(contactList: updatedList);
    } else if (event is ChangeColor) {

      final List<Contact> newList =
          (state as ItemLoaded).contactList.map<Contact>((item) {
        return item.title == event.selectedItem.title
            ? item.backgroundColor = getRandomColor()
            : item;
      }).toList();

      yield ItemLoaded(contactList: newList);
    }
  }
}
