import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

detailAppBar(List exercisesData, double widthScreen){
  return AppBar(
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Stack(
            children: [
              Positioned.fill(
                child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/${exercisesData[0].imagesExercises![0]}')),
              ),
              Positioned.fill(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(color: Colors.transparent),
              ))
            ],
          ),
          title: OrientationBuilder(
            builder: (context, orientation) {
              return SizedBox(
                width: orientation == Orientation.portrait ? MediaQuery.of(context).size.width * 0.8 : MediaQuery.of(context).size.width * 0.8,
                child: TextScroll(
                  exercisesData[0].titleExercises.toString(),
                  velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                  pauseBetween: Duration(seconds: 5),
                  mode: TextScrollMode.endless,
                  textAlign: TextAlign.center,
                ),
              );
            }
          ),
        ),
      );
}