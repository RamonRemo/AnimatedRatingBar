import 'package:flutter/material.dart';

class DiagonallyDown extends AnimatedWidget {
  final Animation<double> controller;

  DiagonallyDown({
    required this.controller,
    required this.child,
    Key? key,
  }) : super(
          key: key,
          listenable: Tween<Offset>(
            begin: const Offset(0, 0),
            end: const Offset(0.15, 0.15),
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
