import 'package:test_f32/features/cart/domain/entities/cart_model.dart';

abstract class CartRepository {

  Future<CartModel> getCart ();

}