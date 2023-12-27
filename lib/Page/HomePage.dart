import 'dart:async';
import 'package:cannabis/intro_pages/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:cannabis/Page/HomeLogin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 2000),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('lib/assets/logo.png'),
      ),

    );
  }
}
