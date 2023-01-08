import 'package:dio/dio.dart';
import 'package:test_f32/features/cart/data/data_sources/api.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  @override
  Future <CartModel> getCart() async{
    return client.getCart();
  }
}