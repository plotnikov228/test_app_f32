import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/components/material_colors.dart';
import 'package:test_f32/features/cart/presentation/presentation/cart_page.dart';
import 'package:test_f32/features/main/presentation/bloc/bloc.dart';
import 'package:test_f32/features/main/presentation/bloc/event.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<CustomBottomNavigationBarItem> bottomNavigationBarItems;
  final int selectedIndex;
  final int productsInCart;
  const CustomBottomNavigationBar({Key? key, required this.bottomNavigationBarItems, required this.selectedIndex, required this.productsInCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.bottomCenter,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: CustomDarkBlueMaterialColor.color,
        ),
        child: Center(
          child: SizedBox(
            height: 18,
            width: MediaQuery.of(context).size.width - 40,
            child: ListView.builder(
              physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              itemCount: bottomNavigationBarItems.length,
              dragStartBehavior: DragStartBehavior.down,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if(index == selectedIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 47,),
                    child: Row(
                      children: [
                        const Icon(CustomIcons.primitive_dot, size: 8, color: Colors.white,),
                        const SizedBox(width: 7,),
                        Text(bottomNavigationBarItems[index].title, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),)
                      ],
                    ),
                  );
                }
                if(index == 1) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 40),
                      child: GestureDetector(
                        onTap: () {
                          if(selectedIndex != index) {
                            context.read<MainBloc>().add(SetupMainEvent(index, context));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                          }
                        },
                          child: Stack(
                            children: [
                              Icon(bottomNavigationBarItems[index].icon, color: Colors.white, size: 18,),
                              Visibility(
                                visible: productsInCart > 0,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 10,
                                    child: CircleAvatar(
                                      backgroundColor: CustomOrangeMaterialColor.color,
                                      child: Text(productsInCart.toString(), style: const TextStyle(fontSize: 6, color: Colors.white),),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                      ),

                  );
                }
                else {
                  return Padding(
                    padding: const EdgeInsets.only(right: 52),
                    child: GestureDetector(
                      onTap: () {
                        if(selectedIndex != index) {
                          context.read<MainBloc>().add(SetupMainEvent(index, context));
                        }
                      }, child: Icon(bottomNavigationBarItems[index].icon, color: Colors.white, size: 18,),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),);
  }
}

class CustomBottomNavigationBarItem {
  final String title;
  final IconData icon;

  CustomBottomNavigationBarItem(this.title, this.icon);
}