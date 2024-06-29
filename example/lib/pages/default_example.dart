import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class DefaultExample extends StatelessWidget {
  const DefaultExample({
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
            animationType: ARBAnimationType.nodLeft,
            onRatingChanged: (value) {
            },
            emptyWidget: const Icon(
              Icons.star_border_rounded,
              size: 60,
              color: Colors.white,
            ),
            fullWidget: const Icon(
              Icons.star_rounded,
              size: 60,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
