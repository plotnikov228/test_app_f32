import 'package:flutter/material.dart';
import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/main/domain/entities/category_model.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';

abstract class MainState {}

class InitialMainState extends MainState {
  final List<BestSellerModel> bestSellerList;
  final List<HotSalesModel> hotSalesList;
  final List<CategoryModel> categories;
  final int productsInCart;
  final int navigationBarIndex;
  final int selectedCategory;
  final bool filterIsOpen;

  InitialMainState(this.bestSellerList, this.hotSalesList, this.categories, this.navigationBarIndex, this.selectedCategory, this.filterIsOpen, this.productsInCart);
}

class CartMainState extends MainState {}

class ErrorMainState extends MainState {}

class LoadingMainState extends MainState {}
