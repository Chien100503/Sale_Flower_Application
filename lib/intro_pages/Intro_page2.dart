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
        color: Colors.red.shade100,
        child: Center(
          child: Lottie.asset('lib/assets/tet2.json'),
        ),
      ),
    );
  }
}
