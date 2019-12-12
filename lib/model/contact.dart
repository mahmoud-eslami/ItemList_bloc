import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Contact extends Equatable {
  final String title;
  final String number;
  final Color backgroundColor;

  Contact({this.title, this.number, this.backgroundColor});

  @override
  List<Object> get props => [title, number, backgroundColor];

  @override
  String toString() =>
      'title : $title , number : $number , backgroundColor : $backgroundColor';

  Contact copyWith({String title, String number, Color backgroundColor}) =>
      Contact(
        title: title ?? this.title,
        number: number ?? this.number,
        backgroundColor: backgroundColor ?? this.backgroundColor,
      );
}
