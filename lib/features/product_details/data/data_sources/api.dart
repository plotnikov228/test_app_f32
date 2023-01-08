import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_f32/features/product_details/domain/entities/product_model.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")

abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  @GET("/6c14c560-15c6-4248-b9d2-b4508df7d4f5")
  Future<ProductModel> getData();
}