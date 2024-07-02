// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:example/pages/default_example.dart';
import 'package:example/pages/first_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFFE5D6C),
      // backgroundColor: Color.fromRGBO(161, 160, 255, 1),
      backgroundColor: Colors.blueGrey[600],

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // StevenUniverseExample(
          //   animationType: ARBAnimationType.shake,
          // ),
          FirstExample(),
          // MarioExample(),
          DefaultExample(),
        ],
      ),
    );
  }
}
