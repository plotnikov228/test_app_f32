// GENERATED CODE - DO NOT MODIFY BY HAND
part of '../../domain/entities/cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: json['id'] as int,
      images: json['images'] as String,
      price: json['price'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'price': instance.price,
      'title': instance.title,
    };
