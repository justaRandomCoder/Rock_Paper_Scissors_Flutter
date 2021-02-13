import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'home_page.dart';

class OpeningPage extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  List<Widget> openingScreen = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openingScreen.add(
      Center(child: Image.asset('images/icon.png')),
    );
    openingScreen.add(Text(
      'Tap to Play',
      style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          setState(
            () {
              openingScreen.add(
                SpinKitWave(
                  size: 50.0,
                  color: Colors.grey,
                  duration: Duration(seconds: 2),
                ),
              );
            },
          );
          Duration threeSeconds = Duration(seconds: 3);
          await Future.delayed(threeSeconds);
          openingScreen.removeLast();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return HomePage();
            }),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: openingScreen,
        ),
      ),
    );
  }
}
