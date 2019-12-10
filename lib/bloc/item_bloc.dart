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
      event.contactList.forEach((item) {
        if (item == event.selectedItem) {
          item.backgroundColor = getRandomColor();
        }
      });
//      for(var i=0;i<event.contactList.length;i++){
//        if(event.contactList[i] == event.selectedItem){
//          event.contactList[i].backgroundColor = getRandomColor();
//        }
//      }
//      var updatedList = event.contactList.where((item) {
//        if(item.backgroundColor == event.selectedItem.backgroundColor){
//          item.backgroundColor = getRandomColor();
//        }
//        return;
//      }).toList();
//      var list = List.from(event.contactList);
      final newList = List<Contact>.generate(
          10,
          (i) => Contact(
              title: event.contactList[i].title,
              number: event.contactList[i].number,
              backgroundColor: event.contactList[i].backgroundColor));

      yield ItemLoaded(contactList: newList);
    }
  }
}
