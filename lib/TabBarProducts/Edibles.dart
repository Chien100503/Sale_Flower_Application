import 'package:flutter/material.dart';

class Edibles extends StatefulWidget {
  const Edibles({super.key});

  @override
  State<Edibles> createState() => _EdiblesState();
}

class _EdiblesState extends State<Edibles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Edibles'
        ),
      ),
    );
  }
}
