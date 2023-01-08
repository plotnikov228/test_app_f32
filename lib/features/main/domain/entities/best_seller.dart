import 'package:json_annotation/json_annotation.dart';

class BestSellerModel {
  final int id;
  @JsonKey(name: 'is_favorites')
  final bool isFavorite;
  final String title;
  @JsonKey(name: 'price_without_discount')
  final int priceWithoutDiscount;
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  final String picture;

  BestSellerModel(
      {required this.id,
      required this.isFavorite,
      required this.title,
      required this.priceWithoutDiscount,
      required this.discountPrice,
      required this.picture});
}