import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/features/main/data/repository/main_repository.dart';
import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/main/domain/entities/category_model.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';
import 'package:test_f32/features/main/domain/usecases/getProductsInCart.dart';
import 'package:test_f32/features/main/domain/usecases/get_best_seller.dart';
import 'package:test_f32/features/main/domain/usecases/get_hot_sales.dart';
import 'package:test_f32/features/main/presentation/bloc/event.dart';
import 'package:test_f32/features/main/presentation/bloc/state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(super.initialState) {
    final repository = MainRepositoryImpl();
    late List<HotSalesModel> getHotSales;
    late List<BestSellerModel> getBestSeller;
    late int productsCount;
    bool filterIsOpen = false;
    int selectedCategory = 0;
    int navigationBarIndex = 0;
    final List<CategoryModel> categories = [
      CategoryModel(icon: CustomIcons.phone, name: 'Phones'),
      CategoryModel(icon: CustomIcons.computer, name: 'Computer'),
      CategoryModel(icon: CustomIcons.health, name: 'Health'),
      CategoryModel(icon: CustomIcons.books, name: 'Books')
    ];
    on<SetupMainEvent>((event, emit) async {
      var _lastNavigatorBarIndex = navigationBarIndex;
      navigationBarIndex = event.pageIndex;
      if (navigationBarIndex == 0) {
        try {
          productsCount = await GetProductsInCart(repository).getProductsInCart();
          getHotSales = await GetHotSales(repository).getHotSales();
          getBestSeller = await GetBestSeller(repository).getBestSeller();
          navigationBarIndex = event.pageIndex;
          emit(InitialMainState(getBestSeller, getHotSales, categories ,navigationBarIndex, selectedCategory, filterIsOpen, productsCount));
        } catch (_) {
          emit(ErrorMainState());
        }
      } if( navigationBarIndex == 1) {
        navigationBarIndex = _lastNavigatorBarIndex;
      } else {
        emit(InitialMainState(getBestSeller, getHotSales, categories ,navigationBarIndex, selectedCategory, filterIsOpen, productsCount));

      }
    });

    on<ChangeCategoryMainEvent>((event, emit) async {
      selectedCategory = event.id;
      emit(InitialMainState(getBestSeller, getHotSales, categories ,navigationBarIndex, selectedCategory, filterIsOpen, productsCount));
    });


    on<ChangeFilterStateMainEvent>((event, emit) async {
      filterIsOpen = !filterIsOpen;
      emit(InitialMainState(getBestSeller, getHotSales, categories ,navigationBarIndex, selectedCategory, filterIsOpen, productsCount));
    });
  }
}
