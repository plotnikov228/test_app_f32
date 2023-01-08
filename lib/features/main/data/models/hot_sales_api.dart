import 'package:json_annotation/json_annotation.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';

part 'hot_sales_api.g.dart';

@JsonSerializable()
class HotSalesApi extends HotSalesModel {
  HotSalesApi({required super.id, required super.isNew, required super.title, required super.subtitle, required super.picture, required super.isBuy});

  factory HotSalesApi.fromJson(Map<String, dynamic> json) => _$HotSalesApiFromJson(json);
  Map<String, dynamic> toJson () => _$HotSalesApiToJson(this);
}