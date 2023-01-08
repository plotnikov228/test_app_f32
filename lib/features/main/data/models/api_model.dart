import 'package:json_annotation/json_annotation.dart';
import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';

part 'api_model.g.dart';

@JsonSerializable()
class ApiModel {
  @JsonKey(name: 'best_seller')
  final List<Map<String, dynamic>> bestSeller;
  @JsonKey(name: 'home_store')
  final List<Map<String, dynamic>> hotSales;

  ApiModel({required this.bestSeller, required this.hotSales});

  factory ApiModel.fromJson(Map<String, dynamic> json) => _$ApiModelFromJson(json);
  Map<String, dynamic> toJson () => _$ApiModelToJson(this);
}