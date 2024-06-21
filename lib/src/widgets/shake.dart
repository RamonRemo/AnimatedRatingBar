import 'package:flutter/material.dart';

class Shake extends AnimatedWidget {
  final AnimationController controller;
  final Curve? curve;
  final Widget child;
  final double animationItensity;

  Shake({
    required this.controller,
    required this.child,
    required this.animationItensity,
    this.curve,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 1,
            end: 7 * animationItensity,
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: curve ?? Curves.easeInSine,
            ),
          ),
        );

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_translation.value, 0),
      child: child,
    );
  }
}
