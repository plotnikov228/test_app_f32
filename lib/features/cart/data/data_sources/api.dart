import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_f32/features/main/data/models/api_model.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';

part 'api.g.dart';

@RestApi(baseUrl: "https://run.mocky.io/v3/")

abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;
  @GET("/53539a72-3c5f-4f30-bbb1-6ca10d42c149")
  Future<CartModel> getCart();
}