import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(quantity: 1)) {
    on<CartIncrementPressed>((event, emit) {
      emit(state.copyWith(quantity: state.quantity + 1));
    });
    on<CartDecrementPressed>((event, emit) {
      final newQty = state.quantity > 1 ? state.quantity - 1 : 1;
      emit(state.copyWith(quantity: newQty));
    });
    on<CartAddQuantity>((event, emit) {
      final newQty = state.quantity + event.quantity;
      emit(state.copyWith(quantity: newQty));
    });

    on<CartReset>((event, emit) {
      emit(state.copyWith(quantity: 1));
    });
  }
}

