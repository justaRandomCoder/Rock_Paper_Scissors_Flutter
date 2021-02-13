import 'package:flutter/material.dart';

class IconButtton extends StatelessWidget {
  final String title;
  final String image;
  IconButtton({this.title, this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.blueGrey,
          backgroundImage: AssetImage('$image'),
        ),
        SizedBox(height: 10.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        )
      ],
    );
  }
}
