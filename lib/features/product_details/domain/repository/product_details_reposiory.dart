import 'package:test_f32/features/product_details/domain/entities/product_model.dart';

abstract class ProductDetailsRepository {
  Future<ProductModel> getProduct ();
}
