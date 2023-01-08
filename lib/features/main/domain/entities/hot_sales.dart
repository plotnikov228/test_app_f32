import 'package:json_annotation/json_annotation.dart';

class HotSalesModel {

  final int id;
  @JsonKey(name: 'is_new')
  final bool? isNew;
  final String title;
  final String subtitle;
  final String picture;
  @JsonKey(name: 'is_buy')
  final bool isBuy;

  HotSalesModel(
      {required this.id,
      required this.isNew,
      required this.title,
      required this.subtitle,
      required this.picture,
      required this.isBuy});
}
