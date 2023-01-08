import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/features/cart/presentation/presentation/cart_page.dart';
import 'package:test_f32/features/main/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/components/material_colors.dart';
import 'package:test_f32/features/main/presentation/bloc/bloc.dart';
import 'package:test_f32/features/main/presentation/bloc/event.dart';
import 'package:test_f32/features/main/presentation/bloc/state.dart';
import 'package:test_f32/features/main/presentation/widgets/explorer_page.dart';
import 'package:test_f32/features/main/presentation/widgets/filter.dart';

class MainPage extends StatelessWidget {
  final int pageIndex;
  const MainPage({Key? key, required this.pageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MainBloc(LoadingMainState())..add(SetupMainEvent(pageIndex, context)),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          var bloc = context.read<MainBloc>();
          if (state is LoadingMainState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is InitialMainState) {
            return Scaffold(
                body: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
              children: [
                    ExplorerPage(
                      bestSellerList: state.bestSellerList,
                      hotSalesList: state.hotSalesList,
                      categories: state.categories,
                      selectedCategory: state.selectedCategory,
                      filterIsOpen: state.filterIsOpen,
                    ),

                    CustomBottomNavigationBar(
                      bottomNavigationBarItems: [
                        CustomBottomNavigationBarItem(
                          'Explorer',
                          CustomIcons.phone,
                        ),
                        CustomBottomNavigationBarItem(
                          'Cart',
                          CustomIcons.cart,
                        ),
                        CustomBottomNavigationBarItem(
                            'Favorites', CustomIcons.heart_outlined),
                        CustomBottomNavigationBarItem(
                            'Personal', CustomIcons.persona),
                      ],
                      selectedIndex: state.navigationBarIndex,
                      productsInCart: state.productsInCart,
                    ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FilterWidget(filterIsOpen: state.filterIsOpen),
                )
              ],
            ),
                  ),
                ));
          } else {
            return const Scaffold(
              body: Center(
                child: Text('Error fetching data!'),
              ),
            );
          }
        },
      ),
    );
  }
}
