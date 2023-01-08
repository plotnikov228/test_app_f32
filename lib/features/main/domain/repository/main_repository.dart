import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';

abstract class MainRepository {
  Future<List<BestSellerModel>> getBestSeller ();
  Future<List<HotSalesModel>> getHotSales ();
  Future<int> getProductsInCart();
}