import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:rps/icon_button.dart';

import 'CardContent.dart';
import 'result_page.dart';

enum rps { rock, paper, scissors }
var _colorUser = Colors.grey;
var _colorMachine = Colors.grey;
final AudioCache player = AudioCache();

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  int _userScore = 0;
  int _machineScore = 0;
  int _machinePicked = 1;
  int _userPicked = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePage();
  }

  void initializePage() {
    _userScore = 0;
    _machineScore = 0;
    _machinePicked = 1;
    _userPicked = 1;
    _colorUser = Colors.grey;
    _colorMachine = Colors.grey;
  }

  void updateUI(var userChoice) {
    int val;
    int user = _userScore;
    int machine = _machineScore;
    for (int i = 0; i < 3; i++) {
      if (rps.values[i] == userChoice) {
        val = i;
      }
    }
    setState(() {
      _userPicked = val + 1;
      _machinePicked = Random().nextInt(3) + 1;

      var machineChoice = rps.values[_machinePicked - 1];
      if (machineChoice == userChoice) {
      } else if (userChoice == rps.rock) {
        machineChoice == rps.paper ? _machineScore++ : _userScore++;
      } else if (userChoice == rps.paper) {
        machineChoice == rps.scissors ? _machineScore++ : _userScore++;
      } else if (userChoice == rps.scissors) {
        machineChoice == rps.rock ? _machineScore++ : _userScore++;
      }
      if (_userScore == user && _machineScore == machine) {
        _colorUser = Colors.grey;
        _colorMachine = Colors.grey;
      } else if (_userScore > user) {
        _colorUser = Colors.blue;
        _colorMachine = Colors.grey;
      } else {
        _colorMachine = Colors.blue;
        _colorUser = Colors.grey;
      }
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF040E35),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'User Score: $_userScore',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Machine Score: $_machineScore',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: width / 5,
                    backgroundColor: _colorUser,
                    backgroundImage: AssetImage('images/image$_userPicked.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: width / 5,
                    backgroundColor: _colorMachine,
                    backgroundImage:
                        AssetImage('images/image$_machinePicked.png'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    player.play('click_vol0.mp3');

                    updateUI(rps.rock);
                  },
                  child: IconButtton(
                    title: 'Rock',
                    image: 'images/image1.png',
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    player.play('click_vol0.mp3');

                    updateUI(rps.paper);
                  },
                  child: IconButtton(
                    title: 'Paper',
                    image: 'images/image2.png',
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    player.play('click_vol0.mp3');
                    updateUI(rps.scissors);
                  },
                  child: IconButtton(
                    title: 'Scissors',
                    image: 'images/image3.png',
                  ),
                ),
              ],
            ),
            CardContent(
              title: 'End Game',
              function: () async {
                player.play('click_vol-1.mp3');
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        userScores: _userScore,
                        compScore: _machineScore,
                      );
                    },
                  ),
                );
                initializePage();
              },
            )
          ],
        ),
      ),
    );
  }
}
