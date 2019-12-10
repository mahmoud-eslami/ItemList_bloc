import 'package:contact_list_bloc/model/contact.dart';
import 'package:equatable/equatable.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();
}

class AppStart extends ItemEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'AppStart{}';
  }
}

class ChangeColor extends ItemEvent {
  final List<Contact> contactList;
  final Contact selectedItem;


  ChangeColor({this.contactList, this.selectedItem});

  @override
  List<Object> get props => [contactList, selectedItem];

  @override
  String toString() {
    return 'ChangeColor{list : $contactList , item : $selectedItem}';
  }
}

class DeleteItem extends ItemEvent {
  final List<Contact> contactList;
  final Contact deletedItem;

  DeleteItem({this.contactList, this.deletedItem});

  @override
  List<Object> get props => [contactList, deletedItem];

  @override
  String toString() {
    return 'DeleteItem{contactList: $contactList, deletedItem: $deletedItem}';
  }
}
