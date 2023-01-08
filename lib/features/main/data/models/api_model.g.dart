// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiModel _$ApiModelFromJson(Map<String, dynamic> json) => ApiModel(
      bestSeller: (json['best_seller'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      hotSales: (json['home_store'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ApiModelToJson(ApiModel instance) => <String, dynamic>{
      'best_seller': instance.bestSeller,
      'home_store': instance.hotSales,
    };
