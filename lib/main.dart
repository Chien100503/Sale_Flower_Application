import 'package:cannabis/TabBarProducts/VapesTab.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart' ;
import 'Page/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body: HomePage(),
      ),
    );
  }
}

