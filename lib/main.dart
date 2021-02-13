import 'package:flutter/material.dart';

import 'opening_page.dart';

void main() {
  runApp(RockPaperScissors());
}

class RockPaperScissors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningPage(),
    );
  }
}
