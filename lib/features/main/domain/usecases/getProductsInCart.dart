import 'package:test_f32/features/main/domain/repository/main_repository.dart';

class GetProductsInCart {
  final MainRepository repository;

  GetProductsInCart(this.repository);

  Future<int> getProductsInCart() async {
    return repository.getProductsInCart();
  }
}