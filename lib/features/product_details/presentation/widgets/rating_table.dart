import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget RatingTable (double rating) {
  List<double> calculateRating(double rating) {
    final list = <double>[];
    var _rating = rating;
    if (rating != 0) {
      for (double i = 0; i <= rating; i++) {
        if (_rating >= 1) {
          list.add(1.0);
          _rating = _rating - 1.0;
        } else {
          list.add(_rating);
          _rating = 0;
          break;
        }
      }
    }
    if (list.length < 5) {
      for (int i = 0; i < 5 - list.length; i++) {
        list.add(0);
      }

    }
    return list;
  }
  var _rating = calculateRating(rating);
  return SizedBox(
      height: 18,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 9),
            child: Icon(
              _rating[0] == 1
                  ? Icons.star
                  : _rating[0] == 0
                  ? Icons.star_border
                  : Icons.star_half,
              size: 18,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 9),
            child: Icon(
              _rating[1] == 1
                  ? Icons.star
                  : _rating[1] == 0
                  ? Icons.star_border
                  : Icons.star_half,
              size: 18,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 9),
            child: Icon(
              _rating[2] == 1
                  ? Icons.star
                  : _rating[2] == 0
                  ? Icons.star_border
                  : Icons.star_half,
              size: 18,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 9),
            child: Icon(
              _rating[3] == 1
                  ? Icons.star
                  : _rating[3] == 0
                  ? Icons.star_border
                  : Icons.star_half,
              size: 18,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: 9),
            child: Icon(
              _rating[4] == 1
                  ? Icons.star
                  : _rating[4] == 0
                  ? Icons.star_border
                  : Icons.star_half,
              size: 18,
              color: Colors.yellow,
            ),
          ),
        ],
      ));



}