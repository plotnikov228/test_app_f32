import 'package:test_f32/features/cart/domain/entities/cart_model.dart';

abstract class CartState {}

class LoadingCartState extends CartState {}
class InitialCartState extends CartState {
  final CartModel cartModel;

  InitialCartState(this.cartModel);
}
class ErrorCartState extends CartState {}