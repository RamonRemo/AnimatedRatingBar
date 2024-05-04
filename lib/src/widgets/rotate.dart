import 'package:flutter/material.dart';

class Rotate extends AnimatedWidget {
  Rotate({
    required Animation<double> controller,
    required this.child,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 0,
            end: 0.3,
          ).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeIn),
          ),
        );

  final Widget child;

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _translation.value,
      child: child,
    );
  }
}
