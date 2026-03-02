import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartIncrementPressed extends CartEvent {
  const CartIncrementPressed();
}

class CartDecrementPressed extends CartEvent {
  const CartDecrementPressed();
}

class CartReset extends CartEvent {
  const CartReset();
}

class CartAddQuantity extends CartEvent {
  final int quantity;

  const CartAddQuantity(this.quantity);
}