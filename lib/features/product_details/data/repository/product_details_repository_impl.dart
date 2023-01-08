import 'package:dio/dio.dart';
import 'package:test_f32/features/product_details/data/data_sources/api.dart';
import 'package:test_f32/features/product_details/domain/entities/product_model.dart';
import 'package:test_f32/features/product_details/domain/repository/product_details_reposiory.dart';

class ProductDetailsRepositoryImpl extends ProductDetailsRepository {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  @override
  Future<ProductModel> getProduct() async {
    return await client.getData();
  }

}