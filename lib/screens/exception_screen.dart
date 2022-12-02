import 'package:flutter/material.dart';

class ExceptionView extends StatefulWidget {
  Exception exception;
  ExceptionView(this.exception, {super.key});

  @override
  State<ExceptionView> createState() => _ExceptionViewState();
}

class _ExceptionViewState extends State<ExceptionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Text(widget.exception.toString(), textAlign: TextAlign.center,))),
    );
  }
}