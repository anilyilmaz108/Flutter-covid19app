import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {

final String title;
final String subtitle;
final String image;

InfoWidget({this.title, this.subtitle, this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Container(
            height: 136,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              image: DecorationImage(alignment: Alignment.topLeft,
                image: NetworkImage(image),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 24,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
          Positioned(
            left: 130,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: 136,
              width: MediaQuery.of(context).size.width - 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                  ),
                  SizedBox(height: 5,),
                  Expanded(
                    child: Text(
                      subtitle,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}