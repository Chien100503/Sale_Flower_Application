import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroTwo extends StatefulWidget {
  const IntroTwo({super.key});

  @override
  State<IntroTwo> createState() => _IntroTwoState();
}

class _IntroTwoState extends State<IntroTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Lottie.asset('lib/assets/intro2.json'),
        ),
      ),
    );
  }
}
