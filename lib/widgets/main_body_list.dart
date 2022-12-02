import 'package:flutter/material.dart';

import '../screens/default/detail_screens.dart';

mainBodyList(List listData, int idx, double widthScreen){
        return Column(
                children: [
                  ListTile(
                    title: Text(
                      listData[idx].nameExercises.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  LimitedBox(
                    maxHeight: widthScreen * 0.34,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listData[idx].listExercises?.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: widthScreen * 0.17,
                            child: ListTile(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetaiScreen(
                                        exercisesData: [
                                          listData[idx].listExercises![index]
                                        ],
                                        widthScreen: widthScreen,
                                      ),
                                    ));
                              }),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/${listData[idx].listExercises?[index].imagesExercises?[0].toString()}'),
                                  height: widthScreen * 0.17,
                                  width: widthScreen * 0.17,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                listData[idx]
                                    .listExercises![index]
                                    .titleExercises
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                listData[idx]
                                    .listExercises![index]
                                    .descriptionExercises
                                    .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }),
                  )
                ],
              );
}