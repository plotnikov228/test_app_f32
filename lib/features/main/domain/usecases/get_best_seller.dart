import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/main/domain/repository/main_repository.dart';

class GetBestSeller {
  final MainRepository repository;
  GetBestSeller(this.repository);

  Future<List<BestSellerModel>> getBestSeller () async{
    return await repository.getBestSeller();
  }
}