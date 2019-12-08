import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String title;
  final String number;

  Contact({this.title, this.number})
      : assert(title != null),
        assert(number != null);

  @override
  List<Object> get props => [title, number];


}

