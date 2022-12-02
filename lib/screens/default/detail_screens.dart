import 'package:flutter/material.dart';

import '../../data/ExercisesModel.dart';
import '../../widgets/datail_list_image.dart';
import '../../widgets/detail_app_bar.dart';
import '../../widgets/detail_image_screen.dart';
import '../../widgets/detail_list_text.dart';

class DetaiScreen extends StatefulWidget {
  List<ExercisesList> exercisesData;
  double widthScreen;
  DetaiScreen(
      {super.key, required this.exercisesData, required this.widthScreen});

  @override
  State<DetaiScreen> createState() => _DetaiScreenState();
}

class _DetaiScreenState extends State<DetaiScreen> {
  late double widthScreens = 0;

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    if (currentOrientation == Orientation.portrait) {
      widthScreens = MediaQuery.of(context).size.width;
    } else {
      widthScreens = MediaQuery.of(context).size.width;
    }
    return Scaffold(
      appBar: detailAppBar(widget.exercisesData, widget.widthScreen),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  ' - ${widget.exercisesData[0].descriptionExercises.toString()}',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
            ),
          ),
          detailListImage(widget.exercisesData, widget.widthScreen),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(
                'Техника выполнения',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          detailTextList(widget.exercisesData, widget.widthScreen),
          detailImageScreen(widget.exercisesData, widget.widthScreen)
        ],
      ),
    );
  }
}
