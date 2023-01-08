import 'package:dio/dio.dart';
import 'package:test_f32/features/main/data/data_sources/api.dart';
import 'package:test_f32/features/main/data/models/best_seller_api.dart';
import 'package:test_f32/features/main/data/models/hot_sales_api.dart';
import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';
import 'package:test_f32/features/main/domain/repository/main_repository.dart';

class MainRepositoryImpl extends MainRepository {

  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  @override
  Future<List<BestSellerModel>> getBestSeller() async {
    final list = await client.getData();
    return list.bestSeller.map((e) => BestSellerApi.fromJson(e)).toList();
  }

  @override
  Future<List<HotSalesModel>> getHotSales() async {
    final list = await client.getData();
    return list.hotSales.map((e) => HotSalesApi.fromJson(e)).toList();
  }

  @override
  Future<int> getProductsInCart() async {
    var cart = await client.getCart();
    return cart.basket.length;
  }

}