import 'package:flutter/material.dart';

class MyMaterialIcon extends StatelessWidget {
  MyMaterialIcon({this.icon,this.color});
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.28,
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          child: Icon(
            icon,size: 60,
            color: color,
          ),
        ),
      ),
    );
  }
}