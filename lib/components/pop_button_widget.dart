import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f32/components/material_colors.dart';

Widget PopButtonWidget (BuildContext context) {
  return SizedBox(
    width: 37,
    child: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      shape: ContinuousRectangleBorder(
          borderRadius:
          BorderRadius.circular(10)),
      elevation: 0,
      backgroundColor:
      CustomDarkBlueMaterialColor
          .color,
      child: const Icon(
        Icons.arrow_back_ios_new,
        size: 14,
      ),
    ),
  );
}