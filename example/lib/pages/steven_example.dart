import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class StevenUniverseExample extends StatelessWidget {
  const StevenUniverseExample({
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
            animationType: ARBAnimationType.rotate,
            onRatingChanged: (value) {
              // print(value);
            },
            emptyWidget: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                'assets/steven2.png',
              ),
            ),
            fullWidget: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                'assets/steven1.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
