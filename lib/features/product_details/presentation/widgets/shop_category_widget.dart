import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_f32/components/custom_icons.dart';
import 'package:test_f32/features/product_details/domain/entities/product_model.dart';

Widget ShopCategoryWidget(ProductModel productDetails) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        children: [
          const Icon(CustomIcons.cpu, color: Colors.grey,),
          const SizedBox(height: 5,),
          Text(productDetails.CPU, style: const TextStyle( fontWeight: FontWeight.w400 ,fontSize: 11,color: Colors.grey),),
        ],
      ),
      Column(
        children: [
          const Icon(CustomIcons.camera, color: Colors.grey,),
          const SizedBox(height: 5,),
          Text(productDetails.camera, style: const TextStyle( fontWeight: FontWeight.w400 ,fontSize: 11,color: Colors.grey),),
        ],
      ),
      Column(
        children: [
          const Icon(CustomIcons.sd, color: Colors.grey,),
          const SizedBox(height: 5,),
          Text(productDetails.ssd, style: const TextStyle( fontWeight: FontWeight.w400 ,fontSize: 11,color: Colors.grey),),
        ],
      ),
      Column(
        children: [
          const Icon(CustomIcons.ssd, color: Colors.grey,),
          const SizedBox(height: 5,),
          Text(productDetails.sd, style: const TextStyle( fontWeight: FontWeight.w400 ,fontSize: 11,color: Colors.grey),),
        ],
      ),
    ],
  );
}
