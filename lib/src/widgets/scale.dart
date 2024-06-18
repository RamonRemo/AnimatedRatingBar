import 'package:flutter/material.dart';

class Scale extends AnimatedWidget {
  final Widget child;
  final Curve? curve;

  Scale({
    required Animation<double> controller,
    required this.child,
    this.curve,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 1,
            end: 1.4,
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
    return ScaleTransition(
      scale: _translation,
      child: child,
    );
  }
}
