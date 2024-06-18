import 'package:example/pages/default_example.dart';
import 'package:example/pages/first_example.dart';
import 'package:example/pages/steven_example.dart';
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
    return const Scaffold(
      backgroundColor: Color(0xFFFE5D6C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StevenUniverseExample(),
          FirstExample(),
          DefaultExample(),
        ],
      ),
    );
  }
}
