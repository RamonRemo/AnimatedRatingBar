import 'package:flutter/material.dart';

class DiagonallyDown extends AnimatedWidget {
  final Animation<double> controller;
  final Widget child;
  final Curve? curve;
  final double animationItensity;

  DiagonallyDown({
    required this.controller,
    required this.child,
    required this.animationItensity,
    this.curve,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0.15, 0.15),
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: curve ?? Curves.easeIn,
            ),
          ),
        );

  Animation<Offset> get _translation => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: _translation.value * animationItensity,
      child: child,
    );
  }
}
