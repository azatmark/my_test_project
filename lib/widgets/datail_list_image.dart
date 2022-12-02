import 'package:flutter/material.dart';

Widget detailListImage(List exercisesData, double widthScreen){
  return SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: widthScreen * 0.8,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // controller: PageController(viewportFraction: 0.95),
                  itemCount: exercisesData[0].imagesExercises?.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      height: widthScreen * 0.8,
                      width: widthScreen * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/${exercisesData[0].imagesExercises?[index]}'))),
                    );
                  })),
            ),
          );
}