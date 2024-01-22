import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroOne extends StatefulWidget {
  const IntroOne({super.key});

  @override
  State<IntroOne> createState() => _IntroOneState();
}

class _IntroOneState extends State<IntroOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Lottie.asset('lib/assets/tet.json'),
        ),
      ),
    );
  }
}
