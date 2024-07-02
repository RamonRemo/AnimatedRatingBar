import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class MarioExample extends StatelessWidget {
  final ARBAnimationType animationType;

  const MarioExample({
    super.key,
    this.animationType = ARBAnimationType.shake,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: AnimatedRatingBar(
              // curve: Curves.bounceIn,
              animationType: animationType,
              onRatingChanged: (value) {
                // print(value);
              },
              emptyWidget: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(
                  'assets/with.png',
                ),
              ),
              fullWidget: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(
                  'assets/without.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
