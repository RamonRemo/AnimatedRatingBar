import 'package:animated_rating_bar/animated_rating_bar.dart';
import 'package:animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class DefaultExample extends StatelessWidget {
  const DefaultExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AnimatedRatingBar(
              // animationItensity: 4,
              animationType: ARBAnimationType.rotate,
              rowHeight: 50,
              emptyWidget: Icon(
                Icons.star_border_rounded,
                size: 48,
                color: Colors.white,
              ),
              fullWidget: Icon(
                Icons.star_rounded,
                size: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}