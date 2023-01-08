import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/features/product_details/data/repository/product_details_repository_impl.dart';
import 'package:test_f32/features/product_details/domain/entities/product_model.dart';
import 'package:test_f32/features/product_details/domain/repository/product_details_reposiory.dart';
import 'package:test_f32/features/product_details/domain/usecases/get_product_details.dart';
import 'package:test_f32/features/product_details/presentation/bloc/event.dart';
import 'package:test_f32/features/product_details/presentation/bloc/state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(super.initialState) {
    late ProductModel productDetails;
    int selectedColor = 0;
    int selectedCapacity = 0;

    on<SetupProductDetailsEvent>((event, emit) async {
      try {
        productDetails = await GetProductDetails(ProductDetailsRepositoryImpl())
            .getProductDetails();
        emit(InitialProductDetailsState(productDetails, selectedColor, selectedCapacity));
      } catch (_) {
        emit(ErrorProductDetailsState());
      }
    });

    on<ChangeColorDetailsEvent>((event, emit) {
      selectedColor = event.index;
      emit(InitialProductDetailsState(productDetails, selectedColor, selectedCapacity));
    });

    on<ChangeCapacityDetailsEvent>((event, emit) {
      selectedCapacity = event.index;
      emit(InitialProductDetailsState(productDetails, selectedColor, selectedCapacity));
    });
  }
}
