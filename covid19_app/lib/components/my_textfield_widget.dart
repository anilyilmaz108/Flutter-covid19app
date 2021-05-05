import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatelessWidget {
  final TextEditingController gunController;
  final String title;

  MyTextFieldWidget({this.gunController,this.title});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: gunController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}