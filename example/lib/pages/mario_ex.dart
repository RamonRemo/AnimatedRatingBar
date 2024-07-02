import 'package:simple_animated_rating_bar/simple_animated_rating_bar.dart';
import 'package:simple_animated_rating_bar/utils/arb_type.dart';
import 'package:flutter/material.dart';

class MarioExample extends StatelessWidget {
  final ARBAnimationType animationType;

  const MarioExample({
    super.key,
    this.animationType = ARBAnimationType.jump,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'simple_animated_rating_bar',
            style: TextStyle(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 150,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: AnimatedRatingBar(
              // curve: Curves.bounceIn,
              animationType: animationType,
              cascadeDuration: const Duration(milliseconds: 75),
              // duration: const Duration(milliseconds: 200),
              // cascadeAnimation: false,
              // reverseDuration: const Duration(milliseconds: 200),
              // cascadeDuration: const Duration(milliseconds: 800),
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
          SizedBox(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
