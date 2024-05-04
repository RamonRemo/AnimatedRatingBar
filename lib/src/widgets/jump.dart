import 'package:flutter/material.dart';
import 'package:simple_animated_rating_bar/src/widgets/rotate.dart';
import 'package:simple_animated_rating_bar/src/widgets/scale.dart';

class Jump extends AnimatedWidget {
  final Animation<double> controller;

  Jump({
    required this.controller,
    required this.child,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0, -0.25),
          ).animate(
            CurvedAnimation(
              parent: controller,
              curve: Curves.easeIn,
            ),
          ),
        );

  final Widget child;

  Animation<Offset> get _translation => listenable as Animation<Offset>;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: _translation.value,
      child: child,
    );
  }
}