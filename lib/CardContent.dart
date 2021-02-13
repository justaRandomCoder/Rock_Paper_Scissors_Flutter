import 'package:flutter/material.dart';

const kTextStyle = TextStyle(color: Colors.black, fontSize: 40.0);

class CardContent extends StatefulWidget {
  final String title;
  final Function function;
  CardContent({this.title, this.function});

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent>
    with SingleTickerProviderStateMixin {
  @override
  AnimationController _animationController;
  Animation animation;
  int currentState = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
        lowerBound: 0.0,
        upperBound: 0.5);
    animation = Tween(begin: -100, end: 60).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 100.0,
      onPressed: () async {
        if (currentState == 0) {
          await _animationController.forward();
          currentState = 1;
        } else {
          await _animationController.reverse();
          currentState = 0;
        }
        widget.function();
      },
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
