// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/entities/product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      CPU: json['CPU'].toString(),
      camera: json['camera'].toString(),
      capacity:
          (json['capacity'] as List<dynamic>).map((e) => e.toString()).toList(),
      color: (json['color'] as List<dynamic>).map((e) => e.toString()).toList(),
      id: json['id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e.toString()).toList(),
      isFavorites: json['isFavorites'] as bool,
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      sd: json['sd'].toString(),
      ssd: json['ssd'].toString(),
      title: json['title'].toString(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'CPU': instance.CPU,
      'camera': instance.camera,
      'capacity': instance.capacity,
      'color': instance.color,
      'id': instance.id,
      'images': instance.images,
      'isFavorites': instance.isFavorites,
      'price': instance.price,
      'rating': instance.rating,
      'sd': instance.sd,
      'ssd': instance.ssd,
      'title': instance.title,
    };
