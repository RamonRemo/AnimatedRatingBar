import 'package:flutter/material.dart';

class Scale extends AnimatedWidget {
  Scale({
    required Animation<double> controller,
    required this.child,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<double>(
            begin: 1,
            end: 1.4,
          ).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeIn),
          ),
        );

  final Widget child;

  Animation<double> get _translation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _translation,
      child: child,
    );
  }
}
