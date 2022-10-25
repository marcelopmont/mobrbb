import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  static const String id = 'dice';

  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  var dice1 = 4;
  var dice2 = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: onDice1Pressed,
                  child: Image.asset('assets/images/dice$dice1.png'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: onDice2Pressed,
                  child: Image.asset('assets/images/dice$dice2.png'),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }

  void onDice1Pressed() {
    setState(() {
      final random = Random();
      dice1 = random.nextInt(6) + 1;
    });
  }

  void onDice2Pressed() {
    setState(() {
      final random = Random();
      dice2 = random.nextInt(6) + 1;
    });
  }
}
