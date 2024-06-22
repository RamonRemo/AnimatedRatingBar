import 'package:flutter/material.dart';
import 'dart:math' as math;

class NodRight extends AnimatedWidget {
  final Widget child;
  final Curve? curve;
  final double animationItensity;

  NodRight({
    required Animation<double> controller,
    required this.child,
    required this.animationItensity,
    this.curve,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 0,
            end: 0.3 * animationItensity,
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: curve ?? Curves.easeIn,
            ),
          ),
        );

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: (_translation.value),
      child: child,
    );
  }
}
