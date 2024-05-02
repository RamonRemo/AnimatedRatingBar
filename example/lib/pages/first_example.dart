import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class FirstExample extends StatelessWidget {
  const FirstExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedRatingBar(
            // animationItensity: 4,
            animationType: ARBAnimationType.bounce,
            onRatingChanged: (value) {
              int rating = value;
            },
            emptyWidget: const Icon(
              Icons.close_rounded,
              size: 48,
              color: Colors.white,
            ),
            fullWidget: const Icon(
              Icons.check_circle_outline_sharp,
              size: 48,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
