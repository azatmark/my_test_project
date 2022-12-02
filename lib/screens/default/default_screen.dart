import 'package:flutter/material.dart';

import '../../data/Data.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/main_body_list.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({super.key});

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  late String title = 'Упражнения на разные группы мышцы';
  final itemsData = DataExercisec();
  late List listData = itemsData.exercisesData;
  late double heigthScreen = 0;
  late double widthScreen = 0;

  final ScrollController _controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    if (currentOrientation == Orientation.portrait) {
      if(mounted){
        setState(() {
        widthScreen = MediaQuery.of(context).size.width;
      });
      }
    } else {
      if(mounted){
        setState(() {
        widthScreen = MediaQuery.of(context).size.height;
      });
      }
    }
    
    return DefaultTabController(
      length: listData.length,
      child: Scaffold(
        appBar: mainAppBar(widthScreen, title, listData, _controller),
        body: ListView.builder(
            controller: _controller,
            itemCount: listData.length,
            itemBuilder: (context, idx) =>
                mainBodyList(listData, idx, widthScreen)),
      ),
    );
  }
}
