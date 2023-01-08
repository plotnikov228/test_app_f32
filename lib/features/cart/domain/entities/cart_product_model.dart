import 'package:json_annotation/json_annotation.dart';

part '../../data/models/cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel {
  final int id;
  final String images;
  final int price;
  final String title;

  CartProductModel({required this.id, required this.images, required this.price, required this.title});

  factory CartProductModel.fromJson (Map<String, dynamic> json) => _$CartProductModelFromJson(json);
  Map<String, dynamic> toJson () => _$CartProductModelToJson(this);
}