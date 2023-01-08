import 'package:test_f32/features/product_details/domain/entities/product_model.dart';

abstract class ProductDetailsState {}

class LoadingProductDetailsState extends ProductDetailsState {}
class InitialProductDetailsState extends ProductDetailsState {
  final ProductModel productDetails;
  final int selectedColor;
  final int selectedCapacity;
  InitialProductDetailsState(this.productDetails, this.selectedColor, this.selectedCapacity);
}
class ErrorProductDetailsState extends ProductDetailsState {}