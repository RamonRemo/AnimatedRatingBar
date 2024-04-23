import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';

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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedRatingBar(
            emptyWidget: Container(
              height: 50,
              width: 50,
              color: Colors.red,
            ),
            fullWidget: Container(
              height: 50,
              width: 50,
              color: Colors.green,
            ),
            ratingLength: 6,
            animationType: ARBAnimationType.rotate,
            cascadeAnimation: true,
          )
        ],
      ),
    );
  }
}
