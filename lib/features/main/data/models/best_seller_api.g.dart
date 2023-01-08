// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_seller_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestSellerApi _$BestSellerApiFromJson(Map<String, dynamic> json) =>
    BestSellerApi(
      id: json['id'] as int,
      isFavorite: json['is_favorites'] as bool,
      title: json['title'] as String,
      priceWithoutDiscount: json['price_without_discount'] as int,
      discountPrice: json['discount_price'] as int,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$BestSellerApiToJson(BestSellerApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_favorites': instance.isFavorite,
      'title': instance.title,
      'price_without_discount': instance.priceWithoutDiscount,
      'discount_price': instance.discountPrice,
      'picture': instance.picture,
    };
