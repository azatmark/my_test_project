
import 'package:flutter/material.dart';
import 'package:sport_execute/screens/loading_screen.dart';
import '../local_data/url_data.dart';
import 'check_connect_screen.dart';
import 'getdata_page.dart';

//Проверка на сохранение данного в локалке
class CheckLocalData extends StatelessWidget {

  final _localData = DataUrl();
  String _urlData = '';

  Future<String> doSomeAsyncStuff() async {
    _urlData = await _localData.getLocalUrl();
    return _urlData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: doSomeAsyncStuff(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            //Загрузка
            return LoadingScreen();
          } else if(snapshot.data == ''){
            //Данные из сети
            return const GetUrlData();
          } else {
            //Данные из локалки
              return CheckAppConnection(urlAdress: snapshot.data.toString(),);
          }
        }
      );
  }
}