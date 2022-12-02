import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:sport_execute/screens/web_page.dart';

class CheckAppConnection extends StatefulWidget {
  String urlAdress;
  CheckAppConnection({super.key, required this.urlAdress});

  @override
  State<CheckAppConnection> createState() => _CheckAppConnectionState();
}

class _CheckAppConnectionState extends State<CheckAppConnection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected 
      ?  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.network_check_rounded, size: 100,),
          Text('Для продолжения необходимо подключение к сети'),
        ],
      ),)
      : WebVeiwPage(webPage: widget.urlAdress)
    );
  }
}