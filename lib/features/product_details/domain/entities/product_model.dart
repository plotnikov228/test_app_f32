import 'package:json_annotation/json_annotation.dart';
part '../../data/models/product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final String CPU;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String id;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  ProductModel(
      {required this.CPU,
      required this.camera,
      required this.capacity,
      required this.color,
      required this.id,
      required this.images,
      required this.isFavorites,
      required this.price,
      required this.rating,
      required this.sd,
      required this.ssd,
      required this.title});

  factory ProductModel.fromJson (Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}