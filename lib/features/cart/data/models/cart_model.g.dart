// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/entities/cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      id: json['id'] as String,
      delivery: json['delivery'] as String,
      total: json['total'] as int,
      basket: (json['basket'] as List<dynamic>)
          .map((e) => CartProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'delivery': instance.delivery,
      'total': instance.total,
      'basket': instance.basket,
    };
