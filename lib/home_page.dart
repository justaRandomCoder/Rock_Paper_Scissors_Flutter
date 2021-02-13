import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rps/CardContent.dart';

import 'play_page.dart';
import 'rules.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF040E35),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardContent(
              title: 'Play',
              function: () {
                player.play('click_vol-1.mp3');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlayPage();
                    },
                  ),
                );
              },
            ),
            CardContent(
              title: 'Rules',
              function: () {
                player.play('click_vol-1.mp3');

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Rules();
                }));
              },
            ),
            CardContent(
              title: 'Exit',
              function: () {
                player.play('click_vol-1.mp3');

                exit(0);
              },
            )
          ],
        ),
      ),
    );
  }
}
