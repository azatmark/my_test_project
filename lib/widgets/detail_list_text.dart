import 'package:flutter/material.dart';

Widget detailTextList(List exercisesData, double widthScreen) {
  return SliverToBoxAdapter(
    child: LimitedBox(
        maxHeight: widthScreen * 1.5,
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: exercisesData[0].technikExercises?.length,
            itemBuilder: ((context, index) {
              return ListTile(
                minVerticalPadding: 10,
                horizontalTitleGap: -20,
                leading: const Text('-'),
                title: Text(
                  exercisesData[0].technikExercises![index].toString(),
                  textAlign: TextAlign.justify,
                ),
              );
            }))),
  );
}
