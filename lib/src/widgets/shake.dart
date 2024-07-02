import 'package:flutter/material.dart';

class Shake extends AnimatedWidget {
  final AnimationController controller;
  final Curve? curve;
  final Widget child;
  final double animationItensity;

  static final tweenSequence = TweenSequence(
    <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: 5),
        weight: 1,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 5, end: -5),
        weight: 1,
      ),
    ],
  );

  Shake({
    required this.controller,
    required this.child,
    required this.animationItensity,
    this.curve,
    Key? key,
  }) : super(
            key: key,
            listenable: tweenSequence.animate(
              CurvedAnimation(
                parent: controller,
                curve: curve ?? Curves.easeInSine,
              ),
            ));

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_translation.value * animationItensity, 0),
      child: child,
    );
  }
}
