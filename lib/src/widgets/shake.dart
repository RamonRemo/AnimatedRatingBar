import 'package:flutter/material.dart';

class Shake extends AnimatedWidget {
  final AnimationController controller;
  final Curve? curve;
  final Widget child;

  Shake({
    required this.controller,
    required this.child,
    this.curve,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 1,
            end: 7,
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
