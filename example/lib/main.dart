import 'package:animated_rating_bar/animated_rating_bar.dart';
import 'package:example/pages/default_example.dart';
import 'package:example/pages/steven_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StevenUniverseExample();
    // return DefaultExample();
  }
}
