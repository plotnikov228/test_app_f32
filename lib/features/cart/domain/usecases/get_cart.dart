
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/cart/domain/repository/cart_repository.dart';

class GetCart {
  final CartRepository repository;

  GetCart(this.repository);

  Future<CartModel> getCart() async {
    return repository.getCart();
  }

}