import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_f32/components/material_colors.dart';
import 'package:test_f32/features/main/presentation/bloc/bloc.dart';
import 'package:test_f32/features/main/presentation/bloc/event.dart';

class FilterWidget extends StatelessWidget {
  final bool filterIsOpen;
  const FilterWidget({Key? key, required this.filterIsOpen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return Visibility(
        visible: filterIsOpen == true,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 375,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 44),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 24),
                          child: SizedBox(
                            height: 37,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 37,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      bloc.add(
                                          ChangeFilterStateMainEvent());
                                    },
                                    backgroundColor:
                                    CustomDarkBlueMaterialColor
                                        .color,
                                    shape:
                                    ContinuousRectangleBorder(
                                        borderRadius:
                                        BorderRadius
                                            .circular(10)),
                                    elevation: 0,
                                    child: const Icon(Icons.close),
                                  ),
                                ),
                                SizedBox(
                                  width: 86,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      bloc.add(
                                          ChangeFilterStateMainEvent());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      CustomOrangeMaterialColor
                                          .color,
                                      shape:
                                      ContinuousRectangleBorder(
                                          borderRadius:
                                          BorderRadius
                                              .circular(
                                              10)),
                                    ),
                                    child: const Text(
                                      'Done',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 52),
                          child: Text('Brand',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 75,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  value: 'Samsung',
                                  child: Text('Samsung'),),
                              ],

                              onChanged: (value) {},
                              value: 'Samsung',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('Price',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 75,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                              items: const [
                                DropdownMenuItem(
                                  value: '\$0 - \$10000',
                                  child: Text('\$0 - \$10000'),),
                              ],
                              onChanged: (value) {},
                              value: '\$0 - \$10000',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('Size',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 75,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white, borderRadius: BorderRadius.circular(5)),
                            child: DropdownButton<String>(

                              items: const [
                                DropdownMenuItem(
                                  value: '4.5 to 5.5 inches',
                                  child: Text('4.5 to 5.5 inches'),),
                              ],
                              underline: SizedBox(),
                              onChanged: (value) {},
                              value: '4.5 to 5.5 inches',
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 31),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Filter Options',
                          style:
                          Theme.of(context).textTheme.headline2,
                        )))
              ],
            ),
          ),
        ));
  }
}
