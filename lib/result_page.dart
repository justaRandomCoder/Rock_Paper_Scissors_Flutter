import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'CardContent.dart';

class ResultPage extends StatelessWidget {
  final int userScores;
  final int compScore;
  final AudioCache player = new AudioCache();
  String text;
  ResultPage({this.userScores, this.compScore}) {
    print(userScores);
    print(compScore);
    if (userScores > compScore) {
      text = 'You Win';
    } else if (userScores < compScore) {
      text = 'YOU LOST';
    } else
      text = 'DRAW';
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040E35),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.grey,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 50.0),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                CardContent(
                  title: 'Play Again',
                  function: () {
                    player.play('click_vol-1.mp3');
                    Navigator.pop(context);
                  },
                ),
                CardContent(
                  title: 'Exit',
                  function: () {
                    exit(0);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
