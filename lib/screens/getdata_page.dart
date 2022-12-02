 //Получение данных из сети
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/FireCubit.dart';
import 'home_screens.dart';

class GetUrlData extends StatelessWidget {
  const GetUrlData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FireCubit()..getString(),
        child: const MyHomePage());
  }
}