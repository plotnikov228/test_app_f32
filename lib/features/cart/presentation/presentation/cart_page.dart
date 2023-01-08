import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/components/material_colors.dart';
import 'package:test_f32/components/pop_button_widget.dart';
import 'package:test_f32/features/cart/domain/entities/cart_model.dart';
import 'package:test_f32/features/cart/presentation/bloc/bloc.dart';
import 'package:test_f32/features/cart/presentation/bloc/event.dart';
import 'package:test_f32/features/cart/presentation/bloc/state.dart';

class CartPage extends StatelessWidget {

  const CartPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) => CartBloc(LoadingCartState())..add(SetupCartEvent()),
      child: BlocBuilder<CartBloc, CartState>(
        builder: ( context, state ) {
          if( state is LoadingCartState) {
            return Center(child: CircularProgressIndicator(),);
          } if(state is InitialCartState) {
            final cartModel = state.cartModel;
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 37,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 42, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              PopButtonWidget(context),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  children: [
                                    Text(
                                      'Product Details',
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    SizedBox(
                                      height: 37,
                                      width: 37,
                                      child: FloatingActionButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(10)),
                                        backgroundColor:
                                        CustomOrangeMaterialColor.color,
                                        elevation: 0,
                                        child: const Icon(CustomIcons.geo_mark),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 42),
                        child: Text(
                          'My Cart',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          height: 690,
                          decoration: BoxDecoration(
                              color: CustomDarkBlueMaterialColor.color,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(33, 70, 0, 0),
                                child: SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount: cartModel.basket.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 45),
                                          child: SizedBox(
                                            height: 90,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    height: 90,
                                                    width: 90,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      child: Image.network(
                                                        cartModel.basket[index].images,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    )),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      3,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        cartModel.basket[index].title,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Text(
                                                        '\$${cartModel.basket[index].price}.00',
                                                        style: TextStyle(
                                                            color:
                                                            CustomOrangeMaterialColor
                                                                .color,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                Container(
                                                  height: 70,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                      color: const Color(0xFF282843),
                                                      borderRadius:
                                                      BorderRadius.circular(26)),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () {},
                                                          child:
                                                          const Icon(Icons.remove)),
                                                      const Text('1'),
                                                      GestureDetector(
                                                          onTap: () {},
                                                          child: const Icon(Icons.add)),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 17,
                                                ),
                                                GestureDetector(
                                                  child: const Icon(CustomIcons.delete,
                                                      color: Color(0xFF282843)),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.25)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50, right: 30),
                                child: SizedBox(height: 45,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400, fontSize: 15),),
                                    Text('\$${cartModel.total} us', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 15),),
                                  ],
                                ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50, right: 30),
                                child: SizedBox(height: 45,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Delivery', style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400, fontSize: 15),),
                                      Text(cartModel.delivery, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 15),),
                                    ],
                                  ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.25)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: SizedBox(
                                  height: 54,
                                  width: MediaQuery.of(context).size.width - 80,
                                  child: ElevatedButton(
                                    onPressed: () {

                                    },
                                    child: const Text('Checkout', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w700),),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          else {
            return const Center(child: Text('Error fetching data!'),);
          }
        }
      ),),
    );





  }
}
