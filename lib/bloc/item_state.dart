import 'package:contact_list_bloc/model/contact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class ItemState extends Equatable {
  const ItemState();
}

class InitialState extends ItemState {
  @override
  String toString() {
    return 'InitialState{}';
  }

  @override
  List<Object> get props => [];
}

class ItemLoaded extends ItemState {
  final List<Contact> contactList;

  ItemLoaded({@required this.contactList});

  @override
  List<Object> get props => [contactList];

  ItemLoaded copyWith(List<Contact> contactList) => ItemLoaded(
        contactList: contactList ?? this.contactList,
      );

  @override
  String toString() {
    return 'ItemLoaded{contactList: $contactList}';
  }
}

class ItemLoading extends ItemState {
  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ItemLoading{}';
  }
}
