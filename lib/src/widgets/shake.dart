import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/src/widgets/rotate.dart';
import 'package:simple_animated_rating_bar/src/widgets/scale.dart';

class Shake extends AnimatedWidget {
  final AnimationController controller;

  Shake({
    required this.controller,
    required this.child,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 1,
            end: 7,
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeInSine,
            ),
          ),
        );

  final Widget child;

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_translation.value, 0),
      child: child,
    );
  }
}
