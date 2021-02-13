import 'package:flutter/material.dart';

import 'CardContent.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/rules.jpg'),
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: 30.0,
            ),
            CardContent(
              title: 'Return',
              function: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
