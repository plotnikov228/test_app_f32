import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/features/main/domain/entities/best_seller.dart';
import 'package:test_f32/features/main/domain/entities/category_model.dart';
import 'package:test_f32/features/main/domain/entities/hot_sales.dart';
import 'package:test_f32/features/main/presentation/bloc/bloc.dart';
import 'package:test_f32/features/main/presentation/bloc/event.dart';

import 'package:test_f32/features/product_details/presentation/presentation/product_details_page.dart';

import '../../../../components/material_colors.dart';

class ExplorerPage extends StatelessWidget {
  final bool filterIsOpen;
  final List<BestSellerModel> bestSellerList;
  final List<HotSalesModel> hotSalesList;
  final List<CategoryModel> categories;
  final int selectedCategory;

  const ExplorerPage({
    Key? key,
    required this.bestSellerList,
    required this.hotSalesList,
    required this.categories,
    required this.selectedCategory, required this.filterIsOpen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*
    final state = ExplorerInheritedWidget.of(context);
*/
    final bloc = context.read<MainBloc>();
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.geo_mark,
                        color: CustomOrangeMaterialColor.color,
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      Text('Zihuatanejo, Gro', style: Theme.of(context).textTheme.bodyText1,),
                      const SizedBox(
                        width: 8,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.keyboard_arrow_down_outlined )),
                    ],
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            bloc.add(ChangeFilterStateMainEvent());
                          },
                          icon: const Icon(CustomIcons.filter, size: 13)))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 27),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Select Category',
                      style: Theme.of(context).textTheme.headline1),

                    Text(
                      'view all',
                      style: TextStyle(
                          fontSize: 15,
                          color: CustomOrangeMaterialColor.color),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 103,
                child: ListView.builder(
                    physics:
                        const ScrollPhysics(parent: BouncingScrollPhysics()),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 13),
                        child: Column(
                          children: [
                            Container(
                              width: 71,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: selectedCategory == index
                                    ? CustomOrangeMaterialColor.color
                                    : Colors.white,
                              ),
                              height: 71,
                              child: IconButton(
                                onPressed: () {
                                  if (selectedCategory != index) {
                                    bloc.add(ChangeCategoryMainEvent(index));
                                  }
                                },
                                icon: Icon(
                                  categories[index].icon,
                                  color: selectedCategory == index
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: Text(
                                categories[index].name,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: selectedCategory == index
                                      ? CustomOrangeMaterialColor.color
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 35, 37, 24),
              child: SizedBox(
                height: 34,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          (69 + 34 + 11 + 14),
                      child: TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(17))),
                            prefixIcon: Icon(
                              CustomIcons.search,
                              color: CustomOrangeMaterialColor.color,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Search',
                            labelStyle: const TextStyle(
                                color: Colors.grey, fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 11),
                    CircleAvatar(
                      backgroundColor: CustomOrangeMaterialColor.color,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CustomIcons.qr,
                            color: Colors.white,
                            size: 14.7,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 17, right: 27, bottom: 8),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Hot Sales',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 15,
                          color: CustomOrangeMaterialColor.color),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 182,
              child: ListView.builder(
                  physics: const PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: hotSalesList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 16, left: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(children: [
                          Image.network(
                            hotSalesList[index].picture,
                            height: 182,
                            width: MediaQuery.of(context).size.width - 32,
                            fit: BoxFit.fill,
                            errorBuilder: (context, widget, _) {
                              return Container(
                                color: Colors.grey,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              top: 14,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible:
                                      hotSalesList[index].isNew ==
                                          true,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          CustomOrangeMaterialColor.color,
                                      child: const Text(
                                        'New',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Text(
                                      hotSalesList[index].title,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          color: Colors.white),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      hotSalesList[index].subtitle,
                                      style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.white),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 26),
                                  child: SizedBox(
                                    width: 98,
                                    height: 23,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const ProductDetailsPage()));
                                      },
                                      child: const Text('Buy now!',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 27),
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      'Best Seller',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'see more',
                      style: TextStyle(
                          fontSize: 15,
                          color: CustomOrangeMaterialColor.color),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 567,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: bestSellerList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 13,
                      childAspectRatio: 2 / 2.7,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 227,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const ProductDetailsPage()));
                                    },
                                    child: SizedBox(
                                      height: 168,
                                      child: Image.network(
                                        bestSellerList[index].picture,
                                        fit: BoxFit.scaleDown,
                                        height: 168,
                                        errorBuilder: (context, widget, _) {
                                          return Container(
                                            color: Colors.grey,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 7, left: 21),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '\$${bestSellerList[index].priceWithoutDiscount}',
                                              style: const TextStyle(
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(
                                              width: 7,
                                            ),
                                            Text(
                                              '\$${bestSellerList[index].discountPrice}',
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                                decoration: TextDecoration
                                                    .lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(bestSellerList[index].title)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, right: 13),
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: FloatingActionButton(
                                    elevation: 0.0,
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    child: Icon(
                                      bestSellerList[index]
                                                  .isFavorite ==
                                              true
                                          ? CustomIcons.heart_1
                                          : CustomIcons.heart_outlined,
                                      color: CustomOrangeMaterialColor.color,
                                      size: 11,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
