import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final int quantity;

  const CartState({required this.quantity});

  CartState copyWith({int? quantity}) {
    return CartState(quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [quantity];
}