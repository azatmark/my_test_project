import 'dart:ui';

import 'package:flutter/material.dart';

mainAppBar(double widthScreen, String title, List listData, ScrollController controller) {


  void _animateToIndex(int index, widthScreen) {
    controller.animateTo(widthScreen * 0.485 * index.toDouble(),
        duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
  }

  return AppBar(
      toolbarHeight: widthScreen * 0.3,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/image_appbar.jpg')),
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.transparent),
            ))
          ],
        ),
        stretchModes: const [StretchMode.fadeTitle],
        centerTitle: true,
        title: Text(
          title.toString(),
          textAlign: TextAlign.center,
        ),
        titlePadding: EdgeInsets.only(
          bottom: widthScreen * 0.2,
        ),
      ),
      bottom: TabBar(
        tabs: listData
            .map((e) => Tab(
                  child: Text(
                    e.nameExercises.toString(),
                  ),
                ))
            .toList(),
        indicatorColor: Colors.white,
        isScrollable: true,
        onTap: ((int index) {
          _animateToIndex(index, widthScreen);
        }),
      ),
    );
    }

