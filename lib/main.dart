import 'package:flutter/material.dart';

import 'calc.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neumorphic Calculator',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Calculation()
      ),
    );
  }
}