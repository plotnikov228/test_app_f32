import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/features/cart/data/repository/cart_repository_impl.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/cart/domain/usecases/get_cart.dart';
import 'package:test_f32/features/cart/presentation/bloc/event.dart';
import 'package:test_f32/features/cart/presentation/bloc/state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(super.initialState) {
    final repository = CartRepositoryImpl();
    late CartModel getCart;

    on<SetupCartEvent>((event, emit) async {
      try {
        getCart = await GetCart(repository).getCart();
        emit(InitialCartState(getCart));
      } catch (_) {
        emit(ErrorCartState());
      }
    });
  }

}