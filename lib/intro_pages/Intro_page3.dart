import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroThree extends StatefulWidget {
  const IntroThree({super.key});

  @override
  State<IntroThree> createState() => _IntroThreeState();
}

class _IntroThreeState extends State<IntroThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.shade100,
        child: Column(
          children: [
            Center(
              child: Lottie.asset('lib/assets/intro3.json'),
            ),Center(
              child: Lottie.asset('lib/assets/tet3.json'),
            ),
          ],
        ),
      ),
    );
  }
}
