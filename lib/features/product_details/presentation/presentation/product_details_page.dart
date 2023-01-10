import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/components/material_colors.dart';
import 'package:test_f32/components/pop_button_widget.dart';
import 'package:test_f32/features/cart/presentation/presentation/cart_page.dart';
import 'package:test_f32/features/product_details/presentation/widgets/rating_table.dart';
import 'package:test_f32/features/product_details/presentation/bloc/bloc.dart';
import 'package:test_f32/features/product_details/presentation/bloc/event.dart';
import 'package:test_f32/features/product_details/presentation/bloc/state.dart';
import 'package:test_f32/features/product_details/presentation/widgets/shop_category_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductDetailsBloc(LoadingProductDetailsState())
          ..add(SetupProductDetailsEvent()),
        child: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
          builder: (context, state) {
            final bloc = context.read<ProductDetailsBloc>();
            if (state is LoadingProductDetailsState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is InitialProductDetailsState) {
              return SafeArea(
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 37,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 42, right: 35),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        PopButtonWidget(context),
                                        Text(
                                          'Product Details',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2,
                                        ),
                                        SizedBox(
                                          width: 37,
                                          child: FloatingActionButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartPage()));
                                            },
                                            shape: ContinuousRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            backgroundColor:
                                                CustomOrangeMaterialColor.color,
                                            elevation: 0,
                                            child: const Icon(CustomIcons.cart),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 37),
                                  child: SizedBox(
                                      height: 349,
                                      child: CarouselSlider.builder(
                                        itemBuilder:
                                            (context, index, realIndex) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 33),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: SizedBox(
                                                  height: 335,
                                                  width: 266,
                                                  child: Image.network(
                                                    state.productDetails
                                                        .images[index]
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          );
                                        },
                                        itemCount:
                                            state.productDetails.images.length,
                                        options: CarouselOptions(
                                            enlargeCenterPage: true,
                                            height: 335),
                                      )),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height - 180,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DefaultTabController(
                                    length: 3,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 28, left: 37, right: 37),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    state.productDetails.title,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4,
                                                  ),
                                                  SizedBox(
                                                    width: 37,
                                                    height: 37,
                                                    child: FloatingActionButton(
                                                      onPressed: () {},
                                                      shape:
                                                          ContinuousRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      elevation: 0,
                                                      backgroundColor:
                                                          CustomDarkBlueMaterialColor
                                                              .color,
                                                      child: Icon(
                                                        state.productDetails
                                                                    .isFavorites ==
                                                                true
                                                            ? CustomIcons
                                                                .heart_1
                                                            : CustomIcons
                                                                .heart_outlined,
                                                        size: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 7, left: 38),
                                              child: RatingTable(
                                                  state.productDetails.rating)),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 32),
                                            child: Center(
                                              child: SizedBox(
                                                height: 33,
                                                child: TabBar(
                                                  indicatorColor:
                                                      CustomOrangeMaterialColor
                                                          .color,
                                                  labelStyle: Theme.of(context)
                                                      .textTheme
                                                      .headline4,
                                                  labelColor:
                                                      CustomDarkBlueMaterialColor
                                                          .color,
                                                  unselectedLabelStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .headline4,
                                                  unselectedLabelColor:
                                                      Colors.grey,
                                                  isScrollable: true,
                                                  tabs: const [
                                                    Tab(text: 'Shop'),
                                                    Tab(text: 'Details'),
                                                    Tab(text: 'Features')
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 33),
                                            child: SizedBox(
                                              height: 47,
                                              child: TabBarView(
                                                children: [
                                                  ShopCategoryWidget(
                                                      state.productDetails),
                                                  ShopCategoryWidget(
                                                      state.productDetails),
                                                  ShopCategoryWidget(
                                                      state.productDetails),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 29, left: 30),
                                            child: Text(
                                              'Select color and capacity',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30, top: 15),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: (39 + 19) *
                                                      state.productDetails.color
                                                          .length
                                                          .toDouble(),
                                                  height: 39,
                                                  child: ListView.builder(
                                                      itemCount: state
                                                          .productDetails
                                                          .color
                                                          .length,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        final color = state
                                                            .productDetails
                                                            .color[index]
                                                            .replaceAll(
                                                                RegExp(
                                                                    r'[^\w\s]+'),
                                                                '');
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 19),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              if (state
                                                                      .selectedColor !=
                                                                  index) {
                                                                bloc.add(
                                                                    ChangeColorDetailsEvent(
                                                                        index));
                                                              }
                                                            },
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Color(int.parse(
                                                                      '0xFF$color')),
                                                              child: state.selectedColor ==
                                                                      index
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .white,
                                                                    )
                                                                  : null,
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),
                                                const SizedBox(width: 40,),
                                                SizedBox(
                                                  width: (76 + 10) *
                                                      state.productDetails
                                                          .capacity.length
                                                          .toDouble(),
                                                  height: 30,
                                                  child: ListView.builder(
                                                      itemCount: state.productDetails.capacity.length,
                                                      scrollDirection: Axis.horizontal,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      itemBuilder: (context, index) {
                                                        return Padding(padding: const EdgeInsets
                                                                        .only(
                                                                    right: 10),
                                                            child:
                                                                SizedBox(
                                                                  child: ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                      shape: ContinuousRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(10)
                                                                      ),
                                                                      elevation: 0,
                                                                      backgroundColor: state.selectedCapacity == index ? CustomOrangeMaterialColor.color : Colors.transparent,
                                                                    ),
                                                              onPressed: () {
                                                                  bloc.add(ChangeCapacityDetailsEvent(index));
                                                              },
                                                              child: Text(
                                                                  '${state.productDetails.capacity[index]} GB',
                                                                  style: TextStyle(
                                                                      color: state.selectedCapacity == index ? Colors.white : Colors.grey,
                                                                      fontWeight: FontWeight.w700,
                                                                      fontSize: 13),
                                                              ),
                                                            ),
                                                                ));
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(padding: const EdgeInsets.only(top: 30),
                                          child: Center(
                                            child: SizedBox(
                                              width: MediaQuery.of(context).size.width - 40,
                                              height: 55,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: ContinuousRectangleBorder(
                                                      borderRadius: BorderRadius.circular(10)
                                                  )),
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    const Text('Add to cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                                                    const SizedBox(width: 50,),
                                                    Text('\$${state.productDetails.price}.00', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),)
                                        ]),
                                  ),
                                ),
                              ]))));
            } else {
              return const Center(
                child: Text('Error fetching data!'),
              );
            }
          },
        ),
      ),
    );
  }
}
