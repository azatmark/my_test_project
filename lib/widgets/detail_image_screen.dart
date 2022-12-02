import 'package:flutter/material.dart';

Widget detailImageScreen(List exercisesData, double widthScreen) {
  return SliverToBoxAdapter(
      child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image(
          width: widthScreen * 0.9,
          height: widthScreen * 0.9,
          fit: BoxFit.contain,
          image: AssetImage('assets/images/${exercisesData[0].descImages}')),
    ));
}
