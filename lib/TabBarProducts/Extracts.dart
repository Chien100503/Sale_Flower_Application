import 'package:flutter/material.dart';

class Extracts extends StatefulWidget {
  const Extracts({super.key});

  @override
  State<Extracts> createState() => _ExtractsState();
}

class _ExtractsState extends State<Extracts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
            'Extracts'
        ),
      ),
    );
  }
}
