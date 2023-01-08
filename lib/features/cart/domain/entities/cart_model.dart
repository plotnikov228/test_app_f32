import 'package:json_annotation/json_annotation.dart';
import 'package:test_f32/features/cart/domain/entities/cart_product_model.dart';

part '../../data/models/cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final String id;
  final String delivery;
  final int total;
  final List<CartProductModel> basket;

  CartModel({required this.id, required this.delivery, required this.total, required this.basket});

  factory CartModel.fromJson (Map<String, dynamic> json) => _$CartModelFromJson(json);
  Map<String, dynamic> toJson () => _$CartModelToJson(this);
}