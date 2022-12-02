import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: const CircularProgressIndicator.adaptive(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
          child: Image(
            height: widthScreen * 0.3,
            width: widthScreen * 0.3,
            fit: BoxFit.cover,
            image: const AssetImage('assets/icons/icon_assets.png')),
        ),
    );
  }
}