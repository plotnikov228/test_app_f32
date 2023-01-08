import 'package:json_annotation/json_annotation.dart';
import 'package:test_f32/features/main/domain/entities/best_seller.dart';


part 'best_seller_api.g.dart';

@JsonSerializable()
class BestSellerApi extends BestSellerModel {
  BestSellerApi(
      {
        required super.id,
        required super.isFavorite,
        required super.title,
        required super.priceWithoutDiscount,
        required super.discountPrice,
        required super.picture});

  factory BestSellerApi.fromJson(Map<String, dynamic> json) => _$BestSellerApiFromJson(json);
  Map<String, dynamic> toJson () => _$BestSellerApiToJson(this);
}
