import 'package:flutter/material.dart';

class MyMaterialWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function onPress;
  MyMaterialWidget({this.title, this.icon, this.color, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.40,
        child: Material(
          color: Colors.white,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20.0),
          child: MaterialButton(
            onPressed: onPress,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 46,
                  color: color
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}