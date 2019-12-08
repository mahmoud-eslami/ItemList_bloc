import 'package:equatable/equatable.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class InitialState extends ItemState {}

class ItemLoading extends ItemState {}

class ItemPop extends ItemState {}
