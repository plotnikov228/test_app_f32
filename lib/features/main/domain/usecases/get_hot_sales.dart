import 'package:test_f32/features/main/domain/entities/hot_sales.dart';
import 'package:test_f32/features/main/domain/repository/main_repository.dart';

class GetHotSales {
  final MainRepository repository;
  GetHotSales(this.repository);

  Future<List<HotSalesModel>> getHotSales () async {
    return await repository.getHotSales();
  }
}