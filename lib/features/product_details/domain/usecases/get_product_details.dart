import 'package:test_f32/features/product_details/domain/entities/product_model.dart';
import 'package:test_f32/features/product_details/domain/repository/product_details_reposiory.dart';

class GetProductDetails {
  final ProductDetailsRepository repository;

  GetProductDetails(this.repository);

  Future<ProductModel> getProductDetails () async {
    return await repository.getProduct();
  }

}